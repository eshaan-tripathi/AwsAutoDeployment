output "lambda_name" {
  value       = aws_lambda_function.demo_lambda.function_name
  description = "Deployed Lambda function name"
}
