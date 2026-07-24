variable "ami" {
    type = string
    default = "ami-0b826bb6d96d2afe4"
  
}

variable "type" {
    type = string
    default = "t2.micro"

}

variable "tags" {
    type = string
    default = "Instance"
  
}

variable "CIDR" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "Region" {
    type = string
    default = "us-east-1"
  
}

variable "tags-VPC" {
    type = string
    default = "VPC-1"
  
}
