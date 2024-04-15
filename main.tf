terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATCKANRH6LXKAOHOA"
  secret_key = "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"
}