terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
  backend "s3" {
    bucket = "devopstraining-bucket-igor"
    # Keys can be used to store different states
    # each of each environment of a project
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}