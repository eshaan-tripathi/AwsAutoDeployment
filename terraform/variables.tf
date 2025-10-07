variable "region" {
  default = "us-east-1"
}

variable "lambda_zip" {
  description = "Path to Lambda ZIP file"
  type        = string
}

variable "lambda_name" {
  description = "Name of Lambda function"
  default     = "demo_service"
}

variable "lambda_handler" {
  description = "Handler function"
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  default     = "nodejs18.x"
}

variable "lambda_role" {
  description = "IAM Role ARN for Lambda"
  type        = string
}
