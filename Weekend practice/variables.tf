variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "security_group_name" {
  description = "Security Group Name"
  type        = string
}

variable "ssh_port" {
  description = "SSH port"
  type        = number
}

variable "http_port" {
  description = "HTTP port"
  type        = number
}

variable "https_port" {
  description = "HTTPS port"
  type        = number
}

variable "ingress_protocol" {
  description = "Ingress Protocol"
  type        = string
}

variable "ingress_cidr_block" {
  description = "Ingress CIDR Block"
  type        = string
}

variable "egress_from_port" {
  description = "Egress From Port"
  type        = number
}

variable "egress_to_port" {
  description = "Egress To Port"
  type        = number
}

variable "egress_protocol" {
  description = "Egress Protocol"
  type        = string
}

variable "egress_cidr_block" {
  description = "Egress CIDR Block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR Block"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "ami_id" {
  description = "Amazon Linux AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "instance_name" {
  description = "EC2 Instance Name"
  type        = string
}

variable "internet_gateway_name" {
  description = "Internet Gateway Name"
  type        = string
}

variable "route_cidr_block" {
  description = "Route table destination CIDR"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}