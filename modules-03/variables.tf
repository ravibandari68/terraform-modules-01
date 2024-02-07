variable "vpc_cidr_block" {
    type = string  
}

variable "private_subnet_cidr" {
    type = string
  
}
variable "private_subnet_name"{
    type = string
}

variable "public_subnet_cidr" {
    type = string
  
}
variable "public_subnet_name"{
    type = string
}


# variable "gateway_id" {
#     type = string
# }
variable "pub-rt_name" {
    type= string
}
variable "private-rt_name" {
    type= string
}

variable "ami_id" {
    type = string
  
}
# variable "allocation_id" {
#     type = string
  
# }