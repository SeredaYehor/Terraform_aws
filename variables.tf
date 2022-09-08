variable "key_name" {
  default = "ssh_key_name"
}

variable "vpn_mode" {
  default = "false"
}

variable "certificate" {
  default = "certificate_arn"
}

variable "record_name" {
  default = "nextcloud.dns_name"
}

variable "hosted_zone_id" {
  default = "route_53_zone_id"
}
