cidr_block            = "10.0.0.0/16"
vpc_name              = "Dev-VPC"

security_group_name   = "Web-SG"
ssh_port              = 22
http_port             = 80
https_port            = 443
ingress_protocol      = "tcp"
ingress_cidr_block    = "0.0.0.0/0"

egress_from_port      = 0
egress_to_port        = 0
egress_protocol       = "-1"
egress_cidr_block     = "0.0.0.0/0"

subnet_cidr_block     = "10.0.1.0/24"
availability_zone     = "us-east-1a"
subnet_name           = "Public-Subnet"

ami_id                = "ami-01edba92f9036f76e"
instance_type         = "t2.micro"
instance_name         = "Terraform-EC2"
internet_gateway_name = "Dev-IGW"

route_cidr_block      = "0.0.0.0/0"
region                = "us-east-1"