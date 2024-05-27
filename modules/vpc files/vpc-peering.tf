provider "aws" {
  region = "us-east-1"
  
}

resource "aws_vpc_peering_connection" "development" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.second.id
  vpc_id        = aws_vpc.main.id
  auto_accept = true

  tags = {
    Name = "VPC pairing for testing"
  }
}

resource "aws_route" "main2second" {
  route_table_id = aws_route_table.rt_1.id
  destination_cidr_block = aws_vpc.second.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.development.id
  
}

resource "aws_route" "second2main" {
  route_table_id = aws_route_table.rt_2.id
  destination_cidr_block = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.development.id
  
}