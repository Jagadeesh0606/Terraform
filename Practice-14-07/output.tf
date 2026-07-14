output "private-ip" {
    value = aws_instance.my-instance.private_ip
  
}

output "public-ip" {
    value = aws_instance.my-instance.public_ip
  
}
