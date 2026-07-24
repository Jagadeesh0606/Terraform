module "EC2" {
    source = "./EC2"
    ami = var.ami
    type = var.type
    tags = var.tags
}

module "VPC" {
    source = "./VPC"
    CIDR = var.CIDR
    Region = var.Region
    tags-VPC = var.tags-VPC
}

