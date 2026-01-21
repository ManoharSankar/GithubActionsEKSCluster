provider "aws"{
    region = var.region
}
module "eks" {
  source = "GITHUBACTIONSEKS/eks"

  cluster_name    = var.cluster_name
  private_subnets = var.private_subnets
  vpc_id          = var.vpc_id
}