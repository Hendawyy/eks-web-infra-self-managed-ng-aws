variable "prefix" {
  description = "Prefix for all resources"
}

variable "eks_name" {
  description = "Name Of The EKS Cluster"
}

variable "eks_version" {
  description = "Version Of The EKS Cluster"
}

variable "Cluster_Name" {
  description = "Name Of The EKS Cluster"
}

variable "eks_cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
}

variable "eks_cluster_ca" {
  description = "Certificate Authority of the EKS cluster"
}

variable "eks_cluster_token" {
  description = "Token for the EKS cluster"
}

variable "eks-NG" {
  description = "Self Managed NG"
}

variable "eks_core_dns" {
  description = "Core DNS EKS"
}

variable "nginx_ingress_sg_id" {
  description = "Nginx Ingress Security Group ID"
}
