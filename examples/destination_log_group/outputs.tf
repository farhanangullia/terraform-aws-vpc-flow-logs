output "flow_log_id" {
  value       = module.vpc-flow-logs-enriched-metadata-log-group.flow_log_id
  description = "The Flow Log ID"
}

output "flow_log_arn" {
  value       = module.vpc-flow-logs-enriched-metadata-log-group.flow_log_arn
  description = "The ARN of the Flow Log."
}