terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# This file will be populated as resources are imported and brought under
# management with Terraform.

# resource "aws_key_pair" "app" {}

# resource "aws_security_group" "app" {}

# resource "aws_instance" "app" {}
