locals {
  create_log_group  = var.log_destination_type != "s3"
  create_log_bucket = var.log_destination_type == "s3" && var.log_destination == null
  log_destination   = (local.create_log_group ? aws_cloudwatch_log_group.this[0].arn : (var.log_destination == null ? aws_s3_bucket.this[0].arn : var.log_destination))
  iam_role_arn      = local.create_log_group ? aws_iam_role.this[0].arn : var.iam_role_arn
}

resource "aws_flow_log" "this" {
  iam_role_arn         = local.iam_role_arn
  log_destination      = local.log_destination
  log_destination_type = var.log_destination_type
  log_format           = "$${version} $${account-id} $${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${protocol} $${packets} $${bytes} $${start} $${end} $${action} $${log-status} $${pkt-src-aws-service} $${pkt-dst-aws-service} $${flow-direction} $${traffic-path}"
  traffic_type         = var.traffic_type
  vpc_id               = var.vpc_id
  tags                 = var.tags
}

resource "aws_cloudwatch_log_group" "this" {
  count = local.create_log_group ? 1 : 0

  name = "vpc-flow-logs-${var.vpc_name}"
}

resource "aws_iam_role" "this" {
  count = local.create_log_group ? 1 : 0

  name = "vpc-flow-logs-role-${var.vpc_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "this" {
  count = local.create_log_group ? 1 : 0

  name = "vpc-flow-logs-policy-${var.vpc_name}"
  role = aws_iam_role.this[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "this" {
  count = local.create_log_bucket ? 1 : 0

  bucket_prefix = "vpc-flow-logs-bucket-${var.vpc_name}"
}