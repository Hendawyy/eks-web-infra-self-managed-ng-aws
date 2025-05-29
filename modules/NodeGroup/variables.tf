variable "prefix" {
  description = "Prefix for all resources"
}

variable "eks_name" {
  description = "Name Of The EKS Cluster"
}

variable "eks_version" {
  description = "Version Of The EKS Cluster"
}

variable "ng_role_arn" {
  description = "Node Group IAM role ARN"
}

variable "ng_worker_node_policy_attachment" {
  description = "Worker Node IAM Policy Attachment"
}

variable "ng_cni_policy_attachment" {
  description = "CNI Policy Attachment"
}

variable "ng_ecr_policy_attachment" {
  description = "ECR Read-Only Policy Attachment"
}

variable "Public_Subnets_ID" {
  description = "IDs Of The Public Subnets"
}

variable "Private_Subnets_ID" {
  description = "IDs Of The Private Subnets"
}

variable "Cluster_Name" {
  description = "Name Of The EKS Cluster"
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

variable "eks_cluster_endpoint" {
  description = "EKS Cluster API endpoint"
}

variable "eks_cluster_certificate_authority_data" {
  description = "EKS Cluster Certificate Authority Data (base64 encoded)"
}

variable "Key_Name" {
  description = "EKS Key Name"
}

variable "ng-instance-profile" {
  description = "NG IAM Instance Profile"
}

variable "account_id" {
  description = "Account ID"
}

variable "ng_role" {
  description = "Node Group Role"
}

variable "VPC_ID" {
  description = "VPC ID"
}

variable "eks" {
  description = "EKS Resource"
}

variable "eks_image_id" {
  description = "EKS Optimized AMI"
}

variable "eks_nodes_sg_id" {
  description = "EKS Node Group Security Group ID"
}
