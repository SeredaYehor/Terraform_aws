resource "aws_security_group" "vpn_sg" {
  count       = var.vpn_mode == "true" ? 1 : 0
  name        = "vpn-server-sg"
  description = "SG for vpn server"
  vpc_id      = var.vpc_id

  ingress {
    from_port          = 1194
    to_port            = 1194
    protocol           = "udp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  ingress {
    from_port           = 22
    to_port             = 22
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }
}
