variable "key_name" {
  default = "ec2_ssh_key_name"
}

variable "certificate" {
  default = "aws_cert_arn"
}

variable "record_name" {
  default = "your_domain"
}

variable "vpc_id" {
}

variable "hosted_zone_id" {
  default = "zone_id"
}

variable "private_sub_id" {
}

variable "public_sub_id" {
}

