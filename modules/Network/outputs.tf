output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.my_vpc.id
}

output "VPC_CIDR" {
  description = "VPC CIDR"
  value       = aws_vpc.my_vpc.cidr_block
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [for subnet in aws_subnet.private_subnet : subnet.id]
}
