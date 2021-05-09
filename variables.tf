variable "log_destination" {
  description = "The ARN of the logging destination. If log_desntination_type set to s3, provide the ARN of your bucket. Otherwise, a bucket will be created for you."
  type        = string
  default     = null
}

variable "iam_role_arn" {
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group."
  type        = string
  default     = null
}

variable "log_destination_type" {
  description = "The type of the logging destination. Valid values: cloud-watch-logs, s3"
  type        = string
  default     = "cloud-watch-logs"
}

variable "vpc_name" {
  description = "VPC name."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to attach to."
  type        = string
}

variable "traffic_type" {
  description = "The type of traffic to capture."
  type        = string
  default     = "ALL"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Key-value map of resource tags"
}