resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags =  local.vpc_final_tags
  
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = var.igw_tags
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block
  map_public_ip_on_launch = true
  #availability_zone = 
  tags = var.public_tags
}