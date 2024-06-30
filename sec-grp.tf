resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Creation of Web Security Group"
  vpc_id      = aws_vpc.web-vpc.id

  tags = {
    Name = "web-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["37.157.3.160/32"]
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

}
