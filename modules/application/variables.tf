variable "vpn_mode" {
  default = "true"
}

variable "certificate" {
  default = "aws_certificate_arn"
}

variable "record_name" {
  default = "nextcloud.your_dns_name"
}

variable "vpc_id" {
}

variable "hosted_zone_id" {
  default = "route_53_hosted_zone_id"
}

variable "private_sub_id" {
}

variable "public_sub_id" {
}

variable "nextcloud_id" {
}
