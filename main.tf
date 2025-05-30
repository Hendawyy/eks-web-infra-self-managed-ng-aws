module "Network" {
  source                = "./modules/Network"
  prefix                = local.prefix
  zone1                 = local.zone1
  zone2                 = local.zone2
  eks_name              = local.eks_name
  vpc_cidr_block        = var.vpc_cidr_block
  Public_Subnets_count  = var.Public_Subnets_count
  Private_Subnets_count = var.Private_Subnets_count
}

module "IAM" {
  source   = "./modules/IAM"
  prefix   = local.prefix
  eks_name = local.eks_name
}

module "Keys" {
  source = "./modules/Keys"
}

module "SecGrp" {
  source         = "./modules/SecGrp"
  VPC_ID         = module.Network.vpc_id
  VPC_CIDR_BLOCK = module.Network.VPC_CIDR
  eks            = module.EKS.eks
}

module "EKS" {
  source                           = "./modules/EKS"
  prefix                           = local.prefix
  eks_name                         = local.eks_name
  eks_version                      = local.eks_version
  eks_role_arn                     = module.IAM.eks_role_arn
  Control_Plane_Policy_attatchment = module.IAM.Control_Plane_Policy_attatchment
  Private_Subnets_ID               = module.Network.private_subnet_ids
  Public_Subnets_ID                = module.Network.public_subnet_ids
  region                           = var.region
  ng_role_arn                      = module.IAM.ng_role_arn
  VPC_ID                           = module.Network.vpc_id
  eks_cluster_sg_id                = module.SecGrp.eks_cluster_sg_id
}

module "NodeGroup" {
  source                                 = "./modules/NodeGroup"
  prefix                                 = local.prefix
  eks_name                               = local.eks_name
  eks_version                            = local.eks_version
  Private_Subnets_ID                     = module.Network.private_subnet_ids
  Public_Subnets_ID                      = module.Network.public_subnet_ids
  ng_role_arn                            = module.IAM.ng_role_arn
  ng_worker_node_policy_attachment       = module.IAM.ng_worker_node_policy_attachment
  ng_cni_policy_attachment               = module.IAM.ng_cni_policy_attachment
  ng_ecr_policy_attachment               = module.IAM.ng_ecr_policy_attachment
  Cluster_Name                           = module.EKS.cluster_name
  node_group_name                        = var.node_group_name
  Capacity_Type                          = var.Capacity_Type
  instance_type                          = var.instance_type
  eks_cluster_certificate_authority_data = module.EKS.eks_cluster_certificate_authority_data
  eks_cluster_endpoint                   = module.EKS.eks_cluster_endpoint
  Key_Name                               = module.Keys.Key_Name
  ng-instance-profile                    = module.IAM.ng-instance-profile
  account_id                             = var.account_id
  ng_role                                = module.IAM.ng_role
  VPC_ID                                 = module.Network.vpc_id
  eks                                    = module.EKS.eks
  eks_image_id                           = var.eks_image_id
  eks_nodes_sg_id                        = module.SecGrp.eks_nodes_sg_id
  ng_instance_profile_name               = module.IAM.ng_instance_profile_name
  node_group_label                       = var.node_group_label
  depends_on                             = [module.EKS]
}

module "Helm" {
  source               = "./modules/Helm"
  prefix               = local.prefix
  eks_name             = local.eks_name
  eks_version          = local.eks_version
  Cluster_Name         = module.EKS.cluster_name
  eks_cluster_ca       = module.EKS.eks_cluster_certificate_authority_data
  eks_cluster_endpoint = module.EKS.eks_cluster_endpoint
  eks_cluster_token    = module.EKS.eks_cluster_token
  eks-NG               = module.NodeGroup.eks-NG
  eks_core_dns         = module.NodeGroup.eks_core_dns
  nginx_ingress_sg_id  = module.SecGrp.nginx_ingress_sg_id
}
