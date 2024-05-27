resource "aws_subnet" "vpc-2_subnet" {
  vpc_id     = aws_vpc.second.id
  cidr_block = var.vpc_2_subnet

  tags = {
    Name = "vpc2 subnet"
  }
}

resource "aws_route_table" "rt_2" {
  vpc_id = aws_vpc.second.id

  route {
    cidr_block = var.rt-2_cidr
    gateway_id = aws_internet_gateway.gw-2.id
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.vpc-2_subnet.id
  route_table_id = aws_route_table.rt_2.id
}

