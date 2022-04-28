resource "aws_instance" "nextcloud" {
  ami 			 = "ami-0fb653ca2d3203ac1"
  instance_type 	 = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nextcloud_sg.id]
  user_data		 = "${file("install_nextcloud")}" 
  subnet_id 		 = var.private_sub_id
  key_name 		 = var.key_name
  tags = {
    Name = "nextcloud"
  }
}

resource "aws_instance" "bastion" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nextcloud_sg.id]
  subnet_id              = var.public_sub_id
  key_name               = var.key_name

  tags = {
    Name = "bastion"
  }
}


