terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-jjjj"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
