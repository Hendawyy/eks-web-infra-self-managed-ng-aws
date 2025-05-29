output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks" {
  value = aws_eks_cluster.eks
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_certificate_authority_data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "eks_cluster_token" {
  value = data.aws_eks_cluster_auth.eks.token
}
