data "aws_availability_zones" "azs_info" {
  state = "available"

}

data "aws_vpc" "main" {
  default = true
}

data "aws_route_table" "default" {
  vpc_id = data.aws_vpc.main.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}