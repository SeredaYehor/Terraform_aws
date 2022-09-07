output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "nextcloud_ip" {
  value = aws_instance.nextcloud.private_ip
}

output "nextcloud_id" {
  value = aws_instance.nextcloud.id
}
