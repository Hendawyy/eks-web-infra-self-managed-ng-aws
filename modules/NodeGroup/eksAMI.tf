data "aws_ami" "eks_optimized" {
  owners      = ["602401143452"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amazon-eks-node-${var.eks_version}*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
