output "private-subnet" {
  value = aws_subnet.private-subnet.id
}

output "public-subnet" {
  value = aws_subnet.public-subnet.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

