resource "aws_key_pair" "gen-key" {
  key_name   = "keynd"
  public_key = file("mygenkey.pub")
}


resource "aws_instance" "web-ec2" {
  ami                    = var.AMI[var.REGION]
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.gen-key.key_name
  subnet_id              = aws_subnet.private-subnet-1.id
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  availability_zone      = var.ZONE1

  tags = {
    Name = "web-ec2"
  }
}

resource "aws_ebs_volume" "web-vol-2" {
  availability_zone = var.ZONE1
  size              = 4

  tags = {
    Name = "Second Volume"
  }
}

resource "aws_volume_attachment" "ebs-attach" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.web-vol-2.id
  instance_id = aws_instance.web-ec2.id
}


output "public_ip" {
  value = aws_instance.web-ec2.public_ip
}

output "private_ip" {
  value = aws_instance.web-ec2.private_ip
}
