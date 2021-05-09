provider "aws" {
  region = var.region
}

variable "region" {
  description = "AWS Region"
  default     = "ap-southeast-1"
}