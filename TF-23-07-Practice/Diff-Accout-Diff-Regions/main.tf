resource "aws_s3_bucket" "one" {
    bucket = "my-root-bucket-name"
    provider = aws.root_account
 
}

resource "aws_s3_bucket" "two" {
    bucket = "my-user-1-bucket-name"
    provider = aws.user1_account
    
}