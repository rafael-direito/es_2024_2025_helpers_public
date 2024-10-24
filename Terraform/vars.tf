variable "aws_access_key_id" {}
# export TF_VAR_aws_access_key_id=""
variable "aws_access_key_secret" {}
# export TF_VAR_aws_access_key_secret=""
variable "aws_session_token" {}
# export TF_VAR_aws_session_token=""

variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment Environment"
  default     = "testing"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the vpc"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "CIDR block for Public Subnet"
  default     = ["10.0.1.0/27", "10.0.1.32/27"]
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "CIDR block for Private Subnet"
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}
