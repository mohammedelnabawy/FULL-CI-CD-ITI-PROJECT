module "bastion" {
  source        = "./bastion"
  EC2_TYPE      = var.EC2_TYPE
  pub_sub_1_id  = module.network.pub_sub_1_id
  vpc_id        = module.network.vpc_id
  SECRET_ARN    = var.SECRET_ARN
}
