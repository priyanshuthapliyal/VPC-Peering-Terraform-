resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

resource "aws_internet_gateway" "gw-2" {
  vpc_id = aws_vpc.second.id

  tags = {
    Name = "vpc 2 igw"
  }
}