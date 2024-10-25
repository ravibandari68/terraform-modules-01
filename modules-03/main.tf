provider "aws" {
  region = "us-east-1"
  access_key = "Abcd"
  secret_key ="wxyz"

}

module "vpc" {
  source = "./vpc"
  vpc_cidr_block   = var.vpc_cidr_block
  
}
module "public-subnet" {
  source = "./subnet"
  vpc_id = module.vpc.vpc
  subnet-01_cidr = var.public_subnet_cidr
  subnet_name = var.public_subnet_name
  map_public_ip = true
  
}
module "InternetGW" {
  source = "./InternetGW"
  vpc_id = module.vpc.vpc
  
  
}

module "pub-RouteTable" {
  source = "./RouteTable"
  vpc_id = module.vpc.vpc
  gateway = module.InternetGW.InternetGW
  route_table_name = var.pub-rt_name
  
}

module "pub-RouteTableAssociation" {
  source = "./RouteTableAssociation"
  subnet_id = module.public-subnet.subnet
  route_table_id = module.pub-RouteTable.RouteTable
  
}

module "public_ec2" {
  source = "./public_ec2"
  subnet_id = module.public-subnet.subnet
  ami_id = var.ami_id
  
}

################################################

module "private-subnet" {
  source = "./subnet"
  vpc_id = module.vpc.vpc
  subnet-01_cidr = var.private_subnet_cidr
  subnet_name = var.private_subnet_name
  map_public_ip = false
  
}
module "natGW" {
  source = "./natGW"
  subnet_id = module.public-subnet.subnet
  #allocation_id = var.allocation_id
  
  
}

module "pri-RouteTable" {
  source = "./RouteTable"
  vpc_id = module.vpc.vpc
  gateway = module.natGW.natGW
  route_table_name = var.private-rt_name
  
}

module "pri-RouteTableAssociation" {
  source = "./RouteTableAssociation"
  subnet_id = module.private-subnet.subnet
  route_table_id = module.pri-RouteTable.RouteTable
  
}


module "private-ec2" {
  source = "./private_Ec2"
  subnet_id = module.private-subnet.subnet
  ami_id = var.ami_id
  
}



