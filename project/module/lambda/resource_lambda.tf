data "archive_file" "lambda_archive" {
  type = "zip"
  source_file = "${path.module}/lambda_code/test-lambda.py"
  output_path = "${path.module}/lambda_code/test-lambda.zip"
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_name
  filename = data.archive_file.lambda_archive.output_path
  source_code_hash = data.archive_file.lambda_archive.output_base64sha256
  runtime = "python3.13"
  timeout = 900
  role = var.lambda_role_arn
  handler = "test-lambda.lambda_handler"
}
