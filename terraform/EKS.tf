module "EKS" {
  source                 = "./EKS"
  vpc_id                 = module.network.vpc_id
  public-sec-id          = module.network.pub_sub_1_id
  priv_sub_1_id          = module.network.priv_sub_1_id
  priv_sub_2_id          = module.network.priv_sub_2_id
  priv_sub_3_id          = module.network.priv_sub_3_id
}