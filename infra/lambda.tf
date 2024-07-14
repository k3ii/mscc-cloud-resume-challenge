data "archive_file" "retrieve_counter" {
  type        = "zip"
  source_file = "../backend/retrieve_counter.py"
  output_path = "../retrieve_counter.zip"
}

data "archive_file" "update_counter" {
  type        = "zip"
  source_file = "../backend/update_counter.py"
  output_path = "../update_counter.zip"
}

resource "aws_lambda_function" "update_counter" {
  filename         = data.archive_file.update_counter.output_path
  source_code_hash = data.archive_file.update_counter.output_base64sha256
  function_name    = var.update_function_name
  role             = aws_iam_role.cloudresume_api_role.arn
  handler          = var.update_handler
  runtime          = var.python_runtime
  timeout          = 10
  memory_size      = 128
}

resource "aws_lambda_function" "retrieve_counter" {
  filename         = data.archive_file.retrieve_counter.output_path
  source_code_hash = data.archive_file.retrieve_counter.output_base64sha256
  function_name    = var.retrieve_function_name
  role             = aws_iam_role.cloudresume_api_role.arn
  handler          = var.retrieve_handler
  runtime          = var.python_runtime
  timeout          = 10
  memory_size      = 128
}

resource "aws_lambda_permission" "visits_lambda_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.retrieve_handler.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.execution_arn}/*/*"
}

resource "aws_lambda_permission" "update_lambda_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.update_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.execution_arn}/*/*"
}


