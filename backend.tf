terraform {
  backend "s3" {
    bucket = "samarth-terraform-state"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}