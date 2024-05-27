resource "aws_instance" "EC-1" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "test"
  subnet_id =  aws_subnet.vpc-1_subnet.id
  vpc_security_group_ids = [aws_security_group.all_traffic1.id]
  associate_public_ip_address = true
}

resource "aws_instance" "EC-2" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "test"
  subnet_id =  aws_subnet.vpc-2_subnet.id
  vpc_security_group_ids = [aws_security_group.all_traffic2.id]
  associate_public_ip_address = true
}