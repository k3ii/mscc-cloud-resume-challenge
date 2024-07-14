# API Gateway REST API
resource "aws_api_gateway_rest_api" "mscc_cloud_resume_challenge_api" {
  name = "msccCloudResumeChallengeAPI"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  api_key_source = "HEADER"

  disable_execute_api_endpoint = false

  tags = {}
}

# /visits resource
resource "aws_api_gateway_resource" "visits_resource" {
  rest_api_id = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id
  parent_id   = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.root_resource_id
  path_part   = "visits"
}

# GET method for /visits
resource "aws_api_gateway_method" "visits_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id
  resource_id   = aws_api_gateway_resource.visits_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# Mock integration for /visits GET method
resource "aws_api_gateway_integration" "visits_get_integration" {
  rest_api_id = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id
  resource_id = aws_api_gateway_resource.visits_resource.id
  http_method = aws_api_gateway_method.visits_get_method.http_method
  type        = "MOCK"

  request_templates = {
    "application/json" = jsonencode({
      statusCode = 200
    })
  }
}

# /update resource
resource "aws_api_gateway_resource" "update_resource" {
  rest_api_id = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id
  parent_id   = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.root_resource_id
  path_part   = "update"
}

# GET method for /update
resource "aws_api_gateway_method" "update_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id
  resource_id   = aws_api_gateway_resource.update_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# Mock integration for /update GET method
resource "aws_api_gateway_integration" "update_get_integration" {
  rest_api_id = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id
  resource_id = aws_api_gateway_resource.update_resource.id
  http_method = aws_api_gateway_method.update_get_method.http_method
  type        = "MOCK"

  request_templates = {
    "application/json" = jsonencode({
      statusCode = 200
    })
  }
}

# Deployment
resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.visits_resource.id,
      aws_api_gateway_method.visits_get_method.id,
      aws_api_gateway_integration.visits_get_integration.id,
      aws_api_gateway_resource.update_resource.id,
      aws_api_gateway_method.update_get_method.id,
      aws_api_gateway_integration.update_get_integration.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

# prod Stage
resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.mscc_cloud_resume_challenge_api.id
  stage_name    = "prod"
}
