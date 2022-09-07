resource "aws_instance" "nextcloud" {
  ami 			 = "ami-0fb653ca2d3203ac1"
  instance_type 	 = "t2.micro"
  vpc_security_group_ids = [var.nextcloud_sg_id, var.lb_sg_id]
  user_data		 = "${file("install_nextcloud")}" 
  subnet_id 		 = var.private_sub_id
  key_name 		 = var.key_name
  iam_instance_profile   = var.iam_role

  tags = {
    Name = "nextcloud"
  }
}

resource "aws_instance" "vpn_server" {
  count                 = var.vpn_mode == "true" ? 1 : 0
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.vpn_sg_id]
  subnet_id              = var.public_sub_id
  key_name               = var.key_name
  iam_instance_profile   = var.iam_role
  user_data              = "${file("install_openvpn_server")}"

  tags = {
    Name = "vpn_server"
  }
}

resource "aws_instance" "bastion" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.nextcloud_sg_id]
  subnet_id              = var.public_sub_id
  key_name               = var.key_name

  tags = {
    Name = "bastion"
  }
}


