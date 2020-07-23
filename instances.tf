resource "aws_instance" "nat" {
  ami                         = "ami-07dfba995513840b5"
  availability_zone           = "eu-central-1a"
  instance_type               = "t2.micro"
  key_name                    = var.aws_key_name
  vpc_security_group_ids      = [aws_security_group.nat.id]
  subnet_id                   = aws_subnet.eu-central-1a-public.id
  associate_public_ip_address = true
  source_dest_check           = false

  tags = {
    Name = "VPC NAT SO"
  }
}

resource "aws_instance" "web-1" {
  ami                         = var.amis[var.aws_region]
  availability_zone           = "eu-central-1a"
  instance_type               = "t2.micro"
  key_name                    = var.aws_key_name
  vpc_security_group_ids      = [aws_security_group.web.id]
  subnet_id                   = aws_subnet.eu-central-1a-public.id
  associate_public_ip_address = true
  source_dest_check           = false

  tags = {
    Name = "Web Server 1 SO"
  }
}

resource "aws_instance" "db-1" {
  ami                    = var.amis[var.aws_region]
  availability_zone      = "eu-central-1a"
  instance_type          = "t2.micro"
  key_name               = var.aws_key_name
  vpc_security_group_ids = [aws_security_group.db.id]
  subnet_id              = aws_subnet.eu-central-1a-private.id
  associate_public_ip_address = true
  source_dest_check      = false

  tags = {
    Name = "DB Server 1 SO"
  }
}

