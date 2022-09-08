module "application" {
  source = "./modules/application"

  public_sub_id  = module.virtual_cloud.public-subnet
  private_sub_id = module.virtual_cloud.private-subnet
  vpc_id         = module.virtual_cloud.vpc_id
  nextcloud_id   = module.instances.nextcloud_id
  vpn_mode       = var.vpn_mode
  certificate    = var.certificate
  record_name    = var.record_name
  hosted_zone_id = var.hosted_zone_id
}
