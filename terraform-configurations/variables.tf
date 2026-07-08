variable "cidr_block" {
  description = "CIDR block of the VPC"
  type = string
  default = ""
}

variable "tag" {
    description = "The tag of the VPC"
    type = string
    default = ""
  
}

variable "cidr_block_subnet" {
    description = "CIDR block of the subnet"
    type = string
    default = ""
  
}

variable "tag_subnet" {
    description = "The tag of the subnet"
    type = string
    default = "subnet"
  
}