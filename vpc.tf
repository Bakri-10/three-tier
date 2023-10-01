##################################
#VPC
##################################


resource "aws_vpc" "sigmatek_vpc" {
  cidr_block       = "10.0.0.0/16"
  

  tags = {
    Name = "sigmatek_vpc"
  }
}



##################################
#Public Subnet
##################################

resource "aws_subnet" "Public_sigmatek_subnet_1" {
  vpc_id            = aws_vpc.sigmatek_vpc.id
  cidr_block        = var.Public_cidr_block1
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public_sigmatek_subnet-1"
  }
}

resource "aws_subnet" "Public_sigmatek_subnet_2" {
  vpc_id            = aws_vpc.sigmatek_vpc.id
  cidr_block        = var.Public_cidr_block2
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public_sigmatek_subnet-2"
  }
}


##################################
#Private Subnet
##################################

resource "aws_subnet" "Private_sigmatek_subnet_1" {
  vpc_id            = aws_vpc.sigmatek_vpc.id
  cidr_block        = var.Private_cidr_block1
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private_sigmatek_subnet_1"
  }
}

resource "aws_subnet" "Private_sigmatek_subnet_2" {
  vpc_id            = aws_vpc.sigmatek_vpc.id
  cidr_block        = var.Private_cidr_block2
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_sigmatek_subnet_2"
  }
}



##################################
#Private Subnet(DB)
##################################

resource "aws_subnet" "Private_sigmatek_subnet_3" {
  vpc_id            = aws_vpc.sigmatek_vpc.id
  cidr_block        = var.Private_cidr_block3
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private_sigmatek_subnet_3"
  }
}

resource "aws_subnet" "Private_sigmatek_subnet_4" {
  vpc_id            = aws_vpc.sigmatek_vpc.id
  cidr_block        = var.Private_cidr_block4
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_sigmatek_subnet_4"
  }
}




##################################
#Internet Gateway
##################################


resource "aws_internet_gateway" "sigmatek_ig" {
  vpc_id = aws_vpc.sigmatek_vpc.id

  tags = {
    Name = "sigmatek_ig"
  }
}

##################################
#NAT Gateway 1
##################################
resource "aws_nat_gateway" "sigmatek_nat1" {
  allocation_id = aws_eip.sigmatek_ep1.id
  subnet_id     = aws_subnet.Public_sigmatek_subnet_1.id

  tags = {
    Name = var.nat_gateway
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # on the Elastic IP for each AZ
  depends_on = [aws_internet_gateway.sigmatek_ig,aws_eip.sigmatek_ep1]
}


##################################
#Elastic Ip 1
##################################
resource "aws_eip" "sigmatek_ep1" {
  vpc      = true
  tags = {
    Name = "var.eip"
  }
}

##################################
#NAT Gateway 2
##################################
resource "aws_nat_gateway" "sigmatek_nat2" {
  allocation_id = aws_eip.sigmatek_ep2.id
  subnet_id     = aws_subnet.Public_sigmatek_subnet_2.id

  tags = {
    Name = var.nat_gateway
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # on the Elastic IP for each AZ
  depends_on = [aws_internet_gateway.sigmatek_ig,aws_eip.sigmatek_ep2]
}


##################################
#Elastic Ip 2
##################################
resource "aws_eip" "sigmatek_ep2" {
  vpc      = true
  tags = {
    Name = "var.eip"
  }
}