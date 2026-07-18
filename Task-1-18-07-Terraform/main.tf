resource "aws_iam_policy" "example" {
  name        = "example-policy"
  description = "My example policy"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_role" "example" {
  name = "example-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_group" "example" {
  name = "example-group"
}

resource "aws_iam_user" "example" {
  name = "example-user"
}

resource "aws_iam_group_membership" "example" {
  name = "example-group-membership"
  users = [aws_iam_user.example.name]
  group = aws_iam_group.example.name
}

resource "aws_iam_role_policy_attachment" "example" {
  role       = aws_iam_role.example.name
  policy_arn = aws_iam_policy.example.arn
}

resource "aws_iam_user_policy_attachment" "example" {
  user       = aws_iam_user.example.name
  policy_arn = aws_iam_policy.example.arn
}

resource "aws_iam_group_policy_attachment" "example" {
  group      = aws_iam_group.example.name
  policy_arn = aws_iam_policy.example.arn
}

resource "aws_iam_instance_profile" "example" {
  name = "example-instance-profile"
  role = aws_iam_role.example.name
}

resource "aws_instance" "example" {
  ami                  = "ami-01edba92f9036f76e"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.example.name
}