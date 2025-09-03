terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
  backend "s3" {
      bucket = "testbuckt0000"
      key    = "jenkins/terraform.tfstate"
      region = "us-east-1"
  }
}
provider "aws" {
    region = "us-east-1"
}
