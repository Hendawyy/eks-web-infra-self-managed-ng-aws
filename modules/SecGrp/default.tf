resource "aws_default_security_group" "default" {
  vpc_id = var.VPC_ID

  ingress = []
  egress  = []

  tags = {
    Name = "Default SG - Empty"
  }
}
