terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "backend" {
  source = "./module/remote-backend"

  aws_region          = var.region
  iam_user_name       = var.iam_user_name
  bucket_name         = var.bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}

output "iam_user_name" {
  description = "The ARN of the IAM user"
  value       = module.backend.iam_user_arn
}

