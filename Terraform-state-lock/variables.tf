variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for Subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for Subnet"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance Type for EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name for EC2 instance"
  type        = string
}