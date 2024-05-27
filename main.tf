terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region

}

module "vpc" {
  source        = "./modules/vpc files"
  ami = var.ami
  main_cidr     = var.main_cidr
  second_cidr = var.second_cidr
  peer_owner_id = var.peer_owner_id
  vpc_1_subnet  = var.vpc_1_subnet
  rt-1_cidr     = var.rt-1_cidr
  vpc_2_subnet = var.vpc_2_subnet
  rt-2_cidr = var.rt-2_cidr
}
