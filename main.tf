# # Create VPC
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "devops-vpc"
#   }
# }

# # Create Public Subnet
# resource "aws_subnet" "public" {
#   vpc_id = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "public-subnet"
#   }
# }

# # Create Security Group
# resource "aws_security_group" "web_sg" {
#   name = "web-sg"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # Create EC2 Instance
# resource "aws_instance" "web" {
#   ami = "ami-0f58b397bc5c1f2e8"
#   instance_type = "t3.micro"

#   subnet_id = aws_subnet.public.id
#   vpc_security_group_ids = [aws_security_group.web_sg.id]

#   tags = {
#     Name = "devops-server"
#   }
# }

# # Create S3 Bucket
# resource "aws_s3_bucket" "bucket" {
#   bucket = "samarth-devops-demo-12345"
# }
 
# Phase 2   
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}