output "database_endpoint" {
  value = module.storage.databases_endpoint
}

output "bastion_ip" {
  value  = module.instances.bastion_ip
}

output "nextcloud_ip" {
  value = module.instances.nextcloud_ip
}
