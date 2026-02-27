locals {
  common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = "true"

  }
  
  vpc_final_tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    },
    var.vpc_tags

  )

  availability_zone =  slice(data.aws_availability_zones.azs_info.names, 0, 2)

  public_subnet_final_tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    },
    var.public_subnet_tags

  )
}