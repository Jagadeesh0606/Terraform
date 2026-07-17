module "vpc" {
  source = "github.com/Jagadeesh0606/Terraform/Terraform-Module-source"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "TestVPC"
}