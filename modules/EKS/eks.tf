resource "aws_eks_cluster" "eks" {
  name     = "${var.prefix}-${var.eks_name}"
  version  = var.eks_version
  role_arn = var.eks_role_arn

  vpc_config {
    endpoint_public_access  = true
    endpoint_private_access = true
    subnet_ids              = var.Private_Subnets_ID
    security_group_ids      = [var.eks_cluster_sg_id]
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [var.Control_Plane_Policy_attatchment]
}

data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.eks.name
}

resource "null_resource" "update_kubeconfig" {
  depends_on = [aws_eks_cluster.eks]

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.eks.name}"
  }
}
