#first VPC
resource "aws_vpc" "main" {
  cidr_block       = var.main_cidr
  instance_tenancy = "default"

  tags = {
    Name = "VPC-1"
  }
}

resource "aws_vpc" "second" {
  cidr_block       = var.second_cidr
  instance_tenancy = "default"
  
  tags = {
    Name = "vpc-2"
  }
}

resource "aws_subnet" "vpc-1_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.vpc_1_subnet

  tags = {
    Name = "vpc1 subnet"
  }
}

resource "aws_route_table" "rt_1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.rt-1_cidr
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.vpc-1_subnet.id
  route_table_id = aws_route_table.rt_1.id
}
