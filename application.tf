module "application" {
  source = "./modules/application"

  public_sub_id  = module.virtual_cloud.public-subnet
  private_sub_id = module.virtual_cloud.private-subnet
  vpc_id         = module.virtual_cloud.vpc_id
  nextcloud_id   = module.instances.nextcloud_id
}
