terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "esh-terra"
    key    = "lambda/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

# ✅ Lambda Deployment
resource "aws_lambda_function" "demo_lambda" {
  filename         = var.lambda_zip
  function_name    = var.lambda_name
  role             = var.lambda_role
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  source_code_hash = filebase64sha256(var.lambda_zip)
  publish       = true 
}

resource "aws_lambda_alias" "prod" {
  name             = "prod"
  function_name    = aws_lambda_function.demo_lambda.function_name
  function_version = aws_lambda_function.demo_lambda.version
}
