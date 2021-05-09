output "flow_log_id" {
  value       = aws_flow_log.this.id
  description = "The Flow Log ID"
}

output "flow_log_arn" {
  value       = aws_flow_log.this.arn
  description = "The ARN of the Flow Log."
}