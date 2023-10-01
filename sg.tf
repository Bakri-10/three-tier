##################################
#Public Subnet
##################################

resource "aws_security_group" "allow_all" {
  name        = var.security_group_name
  description = "Allow web access"
  vpc_id      = aws_vpc.sigmatek_vpc.id

  ingress {
    description      = "Allow web access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sigmatek_SG"
  }
}


##################################
#SG for EC2
##################################

resource "aws_security_group" "allow_tls" {
  name        = var.EC2_security_group_name
  description = "Allow web access"
  vpc_id      = aws_vpc.sigmatek_vpc.id

  ingress {
    description      = "Allow web access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.allow_all.id]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups = [aws_security_group.allow_all.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sigmatek_ec2_SG"
  }
}

##################################
#SG for DB
##################################

resource "aws_security_group" "allow_db" {
  name        = var.DB_security_group_name
  description = "Allow EC2 access DB"
  vpc_id      = aws_vpc.sigmatek_vpc.id

  ingress {
    description      = "Allow port for DB"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.allow_all.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sigmatek_DB_SG"
  }
}