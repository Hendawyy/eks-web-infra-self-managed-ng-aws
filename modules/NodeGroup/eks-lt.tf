resource "aws_launch_template" "eks-lt" {
  name_prefix            = "${var.prefix}-sng-"
  image_id               = var.eks_image_id
  instance_type          = var.instance_type
  key_name               = var.Key_Name
  vpc_security_group_ids = [var.eks_nodes_sg_id]

  user_data = base64encode(templatefile("${path.module}/UserData/eks-Script.sh", {
  cluster_name     = var.Cluster_Name
  cluster_ca       = var.eks_cluster_certificate_authority_data
  cluster_endpoint = var.eks_cluster_endpoint
  node_image       = var.eks_image_id
}))


  iam_instance_profile {
    name = var.ng_instance_profile_name
  }




  tag_specifications {
    resource_type = "instance"
    tags = {
      Name                                        = "${var.prefix}-sng"
      "kubernetes.io/cluster/${var.Cluster_Name}" = "owned"
    }
  }
}
