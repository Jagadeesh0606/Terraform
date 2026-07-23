resource "aws_security_group" "example" {
  name        = "SG-Same-CIDR"
  description = "Example security group"

  ingress = [
    for port in [80,443,8000,9000,3000] : {
        description      = "inbound rules"
        from_port        = port
        to_port          = port
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        security_groups  = []
        self             = false
    }
  ]

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}