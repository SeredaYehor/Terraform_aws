provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "nextcloud" {
  ami 			 = "ami-0fb653ca2d3203ac1"
  instance_type 	 = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nextcloud_sg.id]
  user_data		 = "${file("install_nextcloud")}" 
  subnet_id 		 = aws_subnet.public-subnet.id

  tags = {
    Name = "nextcloud"
  }
}

resource "aws_instance" "bastion" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nextcloud_sg.id]
  subnet_id              = aws_subnet.public-subnet.id

  tags = {
    Name = "bastion"
  }
}

resource "aws_security_group" "nextcloud_sg" {
  name	 = "nextcloud_sg"
  vpc_id = aws_vpc.main.id
  
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
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }

  
  egress {
    from_port		= 0
    to_port		= 0
    protocol		= "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }
}

