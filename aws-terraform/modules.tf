module "eks_network" {
  cidr_block   = var.cidr_block
  project_name = var.project_name
  source       = "./modules/network"
  tags         = local.tags
}