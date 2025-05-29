resource "tls_private_key" "eks" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "eks_key" {
  key_name   = "eks-self-managed-key"
  public_key = tls_private_key.eks.public_key_openssh
}

resource "local_file" "eks_private_key" {
  content              = tls_private_key.eks.private_key_pem
  filename             = "${path.module}/eks-self-managed-key.pem"
  file_permission      = "0400"
  directory_permission = "0700"
}
