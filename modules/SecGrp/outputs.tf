output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "eks_nodes_sg_id" {
  value = aws_security_group.eks_nodes_sg.id
}

output "nginx_ingress_sg_id" {
  value = aws_security_group.nginx_ingress_sg.id
}

output "default_sg_id" {
  value = aws_default_security_group.default.id
}
