terraform {
  required_providers {
    aws = "~> 2.45"
  }
}

provider "aws" {
  region = var.aws["region"]
}

variable "aws" {
  type        = map(string)
  description = "Input parameters for AWS API calls"
}
