terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-013a129d325529d4d"
  instance_type          = "t2.micro"
  key_name               = "aws-ssh-key"
  vpc_security_group_ids = [aws_security_group.ssh.id,aws_security_group.http.id]
  iam_instance_profile   = "${aws_iam_instance_profile.test_profile.name}"

  provisioner "remote-exec" {
    inline = [
      "aws s3 cp s3://rlazoryshchak-bucket/sample-s3-file.txt sample-s3-file.txt"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("/Users/rlazoryshchak/aws-courses/aws-ssh-key.pem")
    timeout     = "4m"
  }
}

resource "aws_security_group" "ssh" {
  ingress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}

resource "aws_security_group" "http" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress = [
    {
      cidr_blocks      = [ "0.0.0.0/0"]
      description      = ""
      from_port        = 80
      ipv6_cidr_blocks = [ "::/0"]
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    }
  ]
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "s3-full-access"
}
