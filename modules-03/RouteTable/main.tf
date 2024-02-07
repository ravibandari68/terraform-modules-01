#create a route table
resource "aws_route_table" "route_table-1" {
  vpc_id       = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway
  }

  tags       = {
    Name     = var.route_table_name
  }
}
