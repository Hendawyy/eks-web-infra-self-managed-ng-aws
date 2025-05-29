variable "vpc_cidr_block" {
  description = "VPC CIDR block"
}

variable "Public_Subnets_count" {
  description = "Public Subnets Count"
}

variable "Private_Subnets_count" {
  description = "Private Subnets Count"
}

variable "node_group_name" {
  description = "Node Group Name"
}

variable "Capacity_Type" {
  description = "Node Group Capacity Type"
}

variable "instance_type" {
  description = "Node Group Instance Type"
}

variable "region" {
  description = "AWS region"
}

variable "account_id" {
  description = "Account ID"
}

variable "eks_image_id" {
  description = "EKS Optimized AMI"
}
