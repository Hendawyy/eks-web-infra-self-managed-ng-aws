output "eks-NG" {
  value = aws_eks_node_group.eks-ng
}

output "eks_core_dns" {
  value = aws_eks_addon.coredns
}
