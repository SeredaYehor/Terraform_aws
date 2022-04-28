output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "nextcloud_ip" {
  value = aws_instance.nextcloud.private_ip
}

output "nextcloud_sg" {
  value = aws_security_group.nextcloud_sg.id
}
