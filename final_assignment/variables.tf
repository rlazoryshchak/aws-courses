variable "dynamodb_table_name" {
  default = "edu-lohika-training-aws-dynamodb"
}

variable "sns_topic_name" {
  default = "edu-lohika-training-aws-sns-topic"
}

variable "sqs_queue_name" {
  default = "edu-lohika-training-aws-sqs-queue"
}

variable "ec2_ami_id" {
  default = "ami-013a129d325529d4d"
}

variable "nat_ec2_ami_id" {
  default = "ami-0032ea5ae08aa27a2"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "aws-ssh-key"
}

variable "rds_engine" {
  default = "postgres"
}

variable "rds_username" {
  default = "rootuser"
}

variable "rds_password" {
  default = "rootuser"
}

variable "rds_db_name" {
  default = "EduLohikaTrainingAwsRds"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "first_public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "first_public_subnet_az" {
  default = "us-west-2a"
}

variable "second_public_subnet_cidr_block" {
  default = "10.0.2.0/24"
}

variable "second_public_subnet_az" {
  default = "us-west-2b"
}

variable "first_private_subnet_cidr_block" {
  default = "10.0.3.0/24"
}

variable "first_private_subnet_az" {
  default = "us-west-2b"
}

variable "second_private_subnet_az" {
  default = "us-west-2c"
}

variable "second_private_subnet_cidr_block" {
  default = "10.0.4.0/24"
}
