resource "aws_instance" "name" {
    ami           = "i-09af913c60fab23e8"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-instance"
    }

    lifecycle {
        create_before_destroy = true
    }

  
}
