variable "ec2_ami_id" {
  default = "ami-013a129d325529d4d"
}

variable "nat_ami_id" {
  default = "ami-0032ea5ae08aa27a2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "aws-ssh-key"
}
