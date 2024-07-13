variable "bucket_name" {
  type = string
}

variable "bucket_content" {
  type = string
}

variable "subdomain_name" {
  type = string
}

variable "python_runtime" {
  type        = string
  default     = "python3.12"
  description = "The python runtime to use."
}

variable "function_handler" {
  type        = string
  default     = "update_counter.handler"
  description = "The handler for the cloudresume-api function."
}

variable "update_function_name" {
  type        = string
  default     = "cloudresume-api-update"
  description = "The name of the cloudresume-api function."
}

variable "retrieve_function_name" {
  type        = string
  default     = "cloudresume-api-retrieve"
  description = "The name of the cloudresume-api function."
}
