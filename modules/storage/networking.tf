resource "aws_db_subnet_group" "database_subnet_group" {
  name          = "rds_group"
  subnet_ids    = [ var.private_sub_id, var.public_sub_id ]
}
