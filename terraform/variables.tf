variable "env" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}


variable "app_image" {
  type = string
}

variable "lambda_function_name" {
  default = "e-commerce_business-campaign-service"
}