resource "aws_security_group" "all_traffic1" {
  name        = "SG_VPC"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id
ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_vpc.main]
tags = {
    Name = "allow_ssh"
  }
}
resource "aws_security_group_rule" "ssh_inbound_access1" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.all_traffic1.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "all_traffic2" {
  name        = "SG_VPC2"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.second.id
ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.second.cidr_block]
  }

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_vpc.second]
tags = {
    Name = "allow_ssh"
  }
}
resource "aws_security_group_rule" "ssh_inbound_access2" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.all_traffic2.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}