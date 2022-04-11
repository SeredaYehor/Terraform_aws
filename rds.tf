resource "aws_db_subnet_group" "default" {
  name		= "rds_group"
  subnet_ids	= [ aws_subnet.private-subnet.id, aws_subnet.public-subnet.id ]
}

resource "aws_security_group" "rds-sg" {
  name        = "terraform_rds_security_group"
  description = "SG for RDS MySQL server"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [ aws_security_group.nextcloud_sg.id ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = "100"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  identifier           = "mydb"
  db_name              = "mydb"
  username             = "root"
  password             = "ne_roots1"
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [ aws_security_group.rds-sg.id ]
  publicly_accessible  = false
  skip_final_snapshot  = true
  multi_az             = false
}
