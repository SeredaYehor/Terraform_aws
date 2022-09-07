module "instances" {
  source = "./modules/instances"

  public_sub_id   = module.virtual_cloud.public-subnet
  private_sub_id  = module.virtual_cloud.private-subnet
  vpc_id 	  = module.virtual_cloud.vpc_id
  iam_role        = module.application.iam_role
  nextcloud_sg_id = module.application.nextcloud_sg_id
  vpn_sg_id       = module.application.vpn_sg_id
  lb_sg_id        = module.application.lb_sg_id
}
