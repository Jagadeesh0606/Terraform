module "vpc" {
  source = "../Terraform-Module-source"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "DevVPC"
}