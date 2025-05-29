variable "prefix" {
  description = "Prefix for all resources"
}

variable "eks_name" {
  description = "Name Of The EKS Cluster"
}

variable "eks_version" {
  description = "Version Of The EKS Cluster"
}

variable "eks_role_arn" {
  description = "EKS Control Plane IAM role"
}

variable "Control_Plane_Policy_attatchment" {
  description = "EKS Control Plane Policy Attatchment"
}

variable "Public_Subnets_ID" {
  description = "IDs Of The Public Subnets"
}

variable "Private_Subnets_ID" {
  description = "IDs Of The Private Subnets"
}

variable "region" {
  description = "AWS region"
}

variable "ng_role_arn" {
  description = "Node Group IAM role ARN"
}

variable "VPC_ID" {
  description = "VPC ID"
}

variable "eks_cluster_sg_id" {
  description = "EKS CLUSTER Security Group ID"
}
