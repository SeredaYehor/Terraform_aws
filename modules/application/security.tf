resource "aws_security_group" "nextcloud_sg" {
  name	 = "nextcloud_sg"
  vpc_id = var.vpc_id
  
  ingress {
    from_port 		= 22
    to_port  		= 22
    protocol 		= "tcp"
    cidr_blocks 	= ["0.0.0.0/0"]
    ipv6_cidr_blocks 	= ["::/0"]
  }

  ingress {
    from_port           = 80
    to_port             = 80
    protocol            = "tcp"
    security_groups     = [ aws_security_group.lb-sg.id ]
  }

  egress {
    from_port		= 0
    to_port		= 0
    protocol		= "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }
}

resource "aws_security_group" "lb-sg" {
  name        = "load-balancer-sg"
  description = "SG for load balancer https target group"
  vpc_id      = var.vpc_id

  ingress {
    from_port          = 443
    to_port            = 443
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }
}
