output "nextcloud_sg_id" {
  value = aws_security_group.nextcloud_sg.id
}

output "lb_sg_id" {
  value = aws_security_group.lb-sg.id
}

output "iam_role" {
  value = aws_iam_instance_profile.vpn-s3-role.name
}
