resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id	= aws_subnet.public-subnet.id
  depends_on 	= [aws_internet_gateway.internet_gw]
}

