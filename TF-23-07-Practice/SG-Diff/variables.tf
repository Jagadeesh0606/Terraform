variable "ingress_rules" {
  default = [
    {
      port = 22
      cidr = "203.0.113.10/32"
      desc = "SSH"
    },
    {
      port = 80
      cidr = "0.0.0.0/0"
      desc = "HTTP"
    },
    {
      port = 443
      cidr = "0.0.0.0/0"
      desc = "HTTPS"
    },
    {
      port = 3306
      cidr = "10.0.1.0/24"
      desc = "MySQL"
    }
  ]
}
