#create an InternetGW
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = var.vpc_id

  tags      = {
    Name    = "InternetGw-1"
  }
}