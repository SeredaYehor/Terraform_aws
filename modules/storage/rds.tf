resource "aws_db_instance" "nextcloud_database" {
  allocated_storage    = "100"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  identifier           = var.database_name
  db_name              = var.database_name
  username             = var.user_name
  password             = var.user_password
  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [ aws_security_group.rds-sg.id ]
  publicly_accessible  = false
  skip_final_snapshot  = true
  multi_az             = false
}
