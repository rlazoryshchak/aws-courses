resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name ="custom VPC"
  }
}

resource "aws_subnet" "first_public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.first_public_subnet_cidr_block
  availability_zone       = var.first_public_subnet_az
  map_public_ip_on_launch = true

  tags = {
    Name ="first_public_subnet"
  }
}

resource "aws_subnet" "second_public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.second_public_subnet_cidr_block
  availability_zone       = var.second_public_subnet_az
  map_public_ip_on_launch = true

  tags = {
    Name ="second_public_subnet"
  }
}

resource "aws_subnet" "first_private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.first_private_subnet_cidr_block
  availability_zone = var.first_private_subnet_az

  tags = {
    Name ="first_private_subnet"
  }
}

resource "aws_subnet" "second_private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.second_private_subnet_cidr_block
  availability_zone = var.second_private_subnet_az

  tags = {
    Name ="second_private_subnet"
  }
}