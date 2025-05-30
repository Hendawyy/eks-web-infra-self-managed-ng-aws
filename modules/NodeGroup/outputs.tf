output "eks-NG" {
  value = aws_autoscaling_group.eks-asg
}

output "eks_core_dns" {
  value = aws_eks_addon.coredns
}

output "debug_user_data" {
  value = templatefile("${path.module}/UserData/eks-Script.sh", {
    cluster_name     = var.Cluster_Name
    cluster_ca       = var.eks_cluster_certificate_authority_data
    cluster_endpoint = var.eks_cluster_endpoint
    node_image       = var.eks_image_id
    capacity_type    = "ON_DEMAND"
    NodesLabel       = var.node_group_label
  })
}
