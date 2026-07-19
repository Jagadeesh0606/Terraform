resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "LB-vpc"
  }

}

resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "LB-public-subnet-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
      Name = "LB-public-subnet-2"
    }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "LB-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "lb_sg" {
  name        = "lb-sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.name.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "web" {
  ami           = "ami-01edba92f9036f76e"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_1.id
  vpc_security_group_ids =[aws_security_group.lb_sg.id]

  tags = {
    Name = "LB-web-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Welcome to the Web Server- Deployed using Terraform</h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF
}

resource "aws_lb_target_group" "web" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.name.id
  tags = {
    Name = "web-target-group"
  }

  health_check {
  enabled             = true
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  path                = "/"
  protocol            = "HTTP"
  matcher             = "200"
 }
}

resource "aws_lb" "web" {

  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  tags = {
    Name = "web-alb"
  }
  security_groups = [
    aws_security_group.lb_sg.id
  ]

  subnets = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.web.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_lb_target_group_attachment" "web" {

  target_group_arn = aws_lb_target_group.web.arn

  target_id = aws_instance.web.id

  port = 80
}


