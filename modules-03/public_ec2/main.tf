resource "aws_instance" "public-ec2" {
    ami = var.ami_id  #ami-0c7217cdde317cfec
    instance_type = "t2.micro"
    key_name = "publicKey"
    subnet_id = var.subnet_id

  
}