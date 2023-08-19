terraform {
    required_version = ">=1.5.4"
    required_providers {
     aws = ">= 5.11.0"
     local= ">=2.4.0"
    }
    backend "s3" {
      bucket = "mybucket-peacevan"
      key    = "terraform.tfstate"
      region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}

module "new-rds-mysql" {
  source = "./modules/new-rds-mysql"
  prefix = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

