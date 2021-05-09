

module "vpc-flow-logs-enriched-metadata-s3" {
  source = "../../"

  log_destination_type = "s3"
  vpc_name             = "foo-bar-vpc"
  vpc_id               = var.vpc_id

  tags = {
    Name = "vpc-flow-logs-enriched-metadata"
  }
}