#eip for nat
resource "aws_eip" "nat" {
  domain = "vpc"   #importnat argument*** if you give vpc = true there is error poppingup "vpc deprectaed"

  #depends_on = [ aws_internet_gateway.internet_gateway ]
  
}

#create a NAT Gw

resource "aws_nat_gateway" "Nat-01" {

  allocation_id = aws_eip.nat.id
  subnet_id     = var.subnet_id
  

  tags = {
    Name = "NATgw"
  }
  
}