locals {
  account_id = data.aws_caller_identity.current.account_id
}

provider "aws" {
  version = ">= 2"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    dynamodb_table = "aws-terraform-terraform"
    bucket         = "aws-terraform-terraform"
    key            = "aws-terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
  }
}

data "aws_caller_identity" "current" {}
