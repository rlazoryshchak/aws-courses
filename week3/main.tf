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

  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.rds.id
  ]

  iam_instance_profile   = "${aws_iam_instance_profile.test_profile.name}"

  provisioner "remote-exec" {
    inline = [
      "aws s3 cp s3://rlazoryshchak-bucket/rds-script.sql rds-script.sql",
      "aws s3 cp s3://rlazoryshchak-bucket/dynamodb-script.sh dynamodb-script.sh"
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

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.test_role.name
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.test_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "s3:*"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = "dynamoDb:*"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_db_instance" "psql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "12.8"
  instance_class         = "db.t2.micro"
  username               = "foo"
  password               = "foobarbaz"
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}

resource "aws_dynamodb_table" "dynamodb" {
  name           = "aws-course-products"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ProductId"

  attribute {
    name = "ProductId"
    type = "N"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.psql.endpoint
}
