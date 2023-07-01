packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source = "github.com/hashicorp/amazon"
    }
  }
}


variable "ami_prefix" {
	type = string
	default = "wordpress-amazon-ec2"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_account_number" {
  type = number
  default = 450259112618
}

variable "ami_id" {
  type = string
  default = "ami-06b09bfacae1453cb"
}

locals {
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}



source "amazon-ebs" "ec2-wordpress" {
  ami_name = "${var.ami_prefix}-${local.timestamp}"
  instance_type = "${var.instance_type}"
  region = "${var.aws_region}"
  source_ami = "${var.ami_id}"
  ssh_username = "ec2-user"
  tags = {
    APP = "Wordpress"
    Name = "${var.ami_prefix}-${local.timestamp}"
  }
}    

build {
  name = "wordpress"
  sources = [
    "source.amazon-ebs.ec2-wordpress"
  ]
}
