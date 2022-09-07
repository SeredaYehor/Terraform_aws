module "storage" {
  source = "./modules/storage"

  public_sub_id  = module.virtual_cloud.public-subnet
  private_sub_id = module.virtual_cloud.private-subnet
  vpc_id 	 = module.virtual_cloud.vpc_id
  nextcloud_sg   = module.application.nextcloud_sg_id
}
