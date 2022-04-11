output "nextcloud-public-dns" {
    value = aws_instance.nextcloud.public_dns
}

output "ec2-public-ip" {
    value = aws_instance.nextcloud.public_ip
}

output "ec2-public-private-dns" {
    value = aws_instance.nextcloud.private_dns
}

output "ec2-public-private-ip" {
    value = aws_instance.nextcloud.private_ip
}

output "db-address" {
    value = aws_db_instance.default.address
}

output "db-arn" {
    value = aws_db_instance.default.arn
}

output "db-domain" {
    value = aws_db_instance.default.domain
}

output "db-id" {
    value = aws_db_instance.default.id
}

output "db-name" {
    value = aws_db_instance.default.name
}

output "db-port" {
    value = aws_db_instance.default.port
}
