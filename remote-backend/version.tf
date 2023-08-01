terraform {
  backend "s3" {
    bucket = "sandrine-terraform-state"
    key    = "Dev/dev.tfstate"
    region = "us-east-1"
   # dynamodb_table = "terraform-lock"
   # access_key = "LOCKID"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = "us-east-1"
  profile = "default"
}