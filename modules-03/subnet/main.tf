#availability zones
#data "aws_availability_zones" "available_zones" {}


#create a public subnet
resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet-01_cidr
  #availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = var.map_public_ip

  tags      = {
    Name    = var.subnet_name
  }
}