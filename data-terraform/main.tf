data "aws_subnet" "example" {
  filter {
    name   = "tag:Name"
    values = ["subnet-1"]
  }
}


resource "aws_instance" "example" {
  ami           = "ami-0b826bb6d96d2afe4"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.example.id

  tags = {
    Name = "ExampleInstance"
  }
}