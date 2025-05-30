resource "aws_eks_addon" "vpc_cni" {
  cluster_name                = var.Cluster_Name
  addon_name                  = "vpc-cni"
  addon_version               = "v1.19.5-eksbuild.3"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "pod_identity" {
  cluster_name                = var.Cluster_Name
  addon_name                  = "eks-pod-identity-agent"
  addon_version               = "v1.3.7-eksbuild.2"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name                = var.Cluster_Name
  addon_name                  = "kube-proxy"
  addon_version               = "v1.32.3-eksbuild.7"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

}

resource "aws_eks_addon" "coredns" {
  cluster_name                = var.Cluster_Name
  addon_name                  = "coredns"
  addon_version               = "v1.11.4-eksbuild.14"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on                  = [aws_autoscaling_group.eks-asg]
}

resource "aws_eks_addon" "ebs_csi" {
  cluster_name                = var.Cluster_Name
  addon_name                  = "aws-ebs-csi-driver"
  addon_version               = "v1.44.0-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on                  = [aws_autoscaling_group.eks-asg]
}
