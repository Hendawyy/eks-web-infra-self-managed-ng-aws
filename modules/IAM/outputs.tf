output "eks_role_arn" {
  value = aws_iam_role.eks.arn
}

output "Control_Plane_Policy_attatchment" {
  value = aws_iam_role_policy_attachment.eks_cluster_policy
}

output "ng_role" {
  value = aws_iam_role.nodes
}

output "ng_role_arn" {
  value = aws_iam_role.nodes.arn
}

output "ng_worker_node_policy_attachment" {
  value = aws_iam_role_policy_attachment.eks_worker_node_policy
}

output "ng_cni_policy_attachment" {
  value = aws_iam_role_policy_attachment.eks_cni_policy
}

output "ng_ecr_policy_attachment" {
  value = aws_iam_role_policy_attachment.ec2_container_registry_read_only
}

output "ng-instance-profile" {
  value = aws_iam_instance_profile.nodes.arn
}
