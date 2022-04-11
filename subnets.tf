resource "aws_subnet" "public-subnet" {
  vpc_id			= aws_vpc.main.id
  cidr_block			= "172.64.0.0/24"
  map_public_ip_on_launch	= "true"
  availability_zone		= "us-east-2a"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id                        = aws_vpc.main.id
  cidr_block                    = "172.64.1.0/24"
  map_public_ip_on_launch       = "false"
  availability_zone             = "us-east-2b"

  tags = {
    Name = "private-subnet"
  }
}

