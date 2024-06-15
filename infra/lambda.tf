data "archive_file" "update_counter" {
  type        = "zip"
  source_dir  = "../cloudresume-api/"
  output_path = "../cloudresume-api.zip"
}

resource "aws_lambda_function" "update_counter" {
  filename         = data.archive_file.update_counter.output_path
  source_code_hash = data.archive_file.update_counter.output_base64sha256
  function_name    = var.function_name
  role             = aws_iam_role.cloudresume_api_role.arn
  handler          = var.function_handler
  runtime          = var.python_runtime
  timeout          = 10
  memory_size      = 128
}
