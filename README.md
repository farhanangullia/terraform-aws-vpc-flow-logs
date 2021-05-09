# VPC Flow Logs with Enriched Metadata Fields

## Overview
This terraform module configures VPC flow logs for a given VPC with enriched metadata fields such as `flow-direction`, `traffic-path`, `pkt-src-aws-service` and `pkt-dst-aws-service`. Here are the resources that will be provisioned and some notable features: 
* AWS VPC Flow Logs with destination set to a newly created CloudWatch Log Group or a newly created / existing S3 bucket
* VPC Flow Logs contains all default fields (Version 2) and additional fields from Version 5. This includes flow-direction, traffic-path, pkt-src-aws-service and pkt-dst-aws-service

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_flow_log.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. | `string` | `null` | no |
| <a name="input_log_destination"></a> [log\_destination](#input\_log\_destination) | The ARN of the logging destination. If log\_desntination\_type set to s3, provide the ARN of your bucket. Otherwise, a bucket will be created for you. | `string` | `null` | no |
| <a name="input_log_destination_type"></a> [log\_destination\_type](#input\_log\_destination\_type) | The type of the logging destination. Valid values: cloud-watch-logs, s3 | `string` | `"cloud-watch-logs"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags | `map(string)` | `{}` | no |
| <a name="input_traffic_type"></a> [traffic\_type](#input\_traffic\_type) | The type of traffic to capture. | `string` | `"ALL"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to attach to. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_flow_log_arn"></a> [flow\_log\_arn](#output\_flow\_log\_arn) | The ARN of the Flow Log. |
| <a name="output_flow_log_id"></a> [flow\_log\_id](#output\_flow\_log\_id) | The Flow Log ID |

## References
* https://aws.amazon.com/about-aws/whats-new/2021/03/amazon-vpc-flow-logs-now-reflects-aws-service-name-traffic-path-and-flow-direction/