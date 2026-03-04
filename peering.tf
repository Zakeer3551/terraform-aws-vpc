resource "aws_vpc_peering_connection" "roboshop-default" {
  count = var.is_peering_required ? 1 : 0

  #Accepter vpc
  peer_vpc_id   = data.aws_vpc.main.id 
  #Requestor vpc
  vpc_id        = aws_vpc.main.id
  auto_accept = true

}

resource "aws_route" "public_default" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = aws_route_table.public.id
  destination_cidr_block = data.aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}

resource "aws_route" "private_default" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = aws_route_table.private.id
  destination_cidr_block = data.aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}

resource "aws_route" "database_default" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = aws_route_table.database.id
  destination_cidr_block = data.aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}

resource "aws_route" "default_public" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = data.aws_route_table.default.id
  destination_cidr_block = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.roboshop-default[count.index].id
}