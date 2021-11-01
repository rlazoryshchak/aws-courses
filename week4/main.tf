terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "public_ec2" {
  ami                         = var.ec2_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    sudo su
    echo "<h1>Public subnet response</h1>" > index.html
    python3 -m http.server 80 &
  EOF


  tags = {
    Name = "public_ec2"
  }
}

resource "aws_instance" "private_ec2" {
  ami                         = var.ec2_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet.id
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  key_name                    = var.key_name
  associate_public_ip_address = false
  user_data                   = <<-EOF
    #!/bin/bash
    sudo su
    echo "<h1>Private subnet response</h1>" > index.html
    python3 -m http.server 80 &
  EOF

  tags = {
    Name = "private_ec2"
  }
}

resource "aws_instance" "nat_ec2" {
  ami                    = var.nat_ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.public_security_group.id]
  source_dest_check      = false
  key_name               = var.key_name

  tags = {
    Name = "nat_ec2"
  }
}
