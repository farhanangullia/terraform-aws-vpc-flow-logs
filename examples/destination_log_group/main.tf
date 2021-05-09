

module "vpc-flow-logs-enriched-metadata-log-group" {
  source = "../../"

  vpc_name = "foo-bar-vpc"
  vpc_id   = var.vpc_id

  tags = {
    Name = "vpc-flow-logs-enriched-metadata"
  }
}