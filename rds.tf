##################################
#DB subnet
##################################

# resource "aws_db_subnet_group" "default" {
#   name       = var.rds_name
#   subnet_ids = [aws_subnet.Private_sigmatek_subnet_3.id, aws_subnet.Private_sigmatek_subnet_3.id]

# }


###################
# resource "aws_rds_cluster" "default" {
#   cluster_identifier      = "mysql"
#   engine                  = "mysql"
#   engine_version          = "mysql.8.0.33"
#   availability_zones      = ["us-east-1a", "us-east-1b"]
#   database_name           = "sigmatek_DB"
#   master_username         = "admin"
#   master_password         = "admin"
# }