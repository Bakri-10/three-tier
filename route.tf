##################################
#Route_table public
##################################


resource "aws_route_table" "sigmatek_public_rt" {
  vpc_id = aws_vpc.sigmatek_vpc.id

  route = {
    cidr_block         = var.all_ips
    gateway_id         = aws_internet_gateway.sigmatek_ig.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Public_sigmatek_subnet_1.id
  route_table_id = aws_route_table.sigmatek_public_rt.id
}


resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.Public_sigmatek_subnet_2.id
  route_table_id = aws_route_table.sigmatek_rtsigmatek_public_rt.id
}


##################################
#Route_table private
##################################

resource "aws_route_table" "sigmatek_private_rt" {
  vpc_id = aws_vpc.sigmatek_vpc.id

  route = {
    cidr_block         = var.all_ips
    gateway_id         = aws_internet_gateway.sigmatek_ig.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Private_sigmatek_subnet_1.id
  route_table_id = aws_route_table.sigmatek_private_rt.id
}


resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.Private_sigmatek_subnet_1.id
  route_table_id = aws_route_table.sigmatek_private_rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.Private_sigmatek_subnet_1.id
  route_table_id = aws_route_table.sigmatek_private_rt.id
}


resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.Private_sigmatek_subnet_1.id
  route_table_id = aws_route_table.sigmatek_private_rt.id
}
