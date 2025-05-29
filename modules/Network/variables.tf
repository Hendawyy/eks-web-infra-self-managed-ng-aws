variable "prefix" {
  description = "Prefix for all resources"
}

variable "zone1" {
  description = "Availability Zone 1"
}

variable "zone2" {
  description = "Availability Zone 2"
}

variable "eks_name" {
  description = "Name Of The EKS Cluster"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
}

variable "Public_Subnets_count" {
  description = "Public Subnets Count"
}

variable "Private_Subnets_count" {
  description = "Private Subnets Count"
}
