resource "aws_iam_role" "lambda_role" {
    name = "lambda_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            },
        ]
    })
}

resource "aws_iam_role_policy" "lambda_policy" {
    name = "lambda_policy"
    role = aws_iam_role.lambda_role.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:PutLogEvents",
                ]
                Effect   = "Allow"
                Resource = "*"
            },
        ]
    })
}


resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "jagadeeswar-lambda-bucket-2026"
}

resource "aws_s3_object" "lambda_zip" {

  bucket = aws_s3_bucket.lambda_bucket.id

  key = "lambda_function.zip"

  source = "lambda_function.zip"

  etag = filemd5("lambda_function.zip")
}


resource "aws_lambda_function" "my_lambda" {

  function_name = "my_lambda"

  role = aws_iam_role.lambda_role.arn

  runtime = "python3.13"

  handler = "lambda_function.lambda_handler"

  s3_bucket = aws_s3_bucket.lambda_bucket.id

  s3_key = aws_s3_object.lambda_zip.key

  source_code_hash = filebase64sha256("lambda_function.zip")

  timeout = 30

  memory_size = 128
}

resource "aws_cloudwatch_event_rule" "lambda_schedule" {
  name                = "lambda_schedule"
  description         = "Trigger Lambda function every 5 minutes"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "lambda_schedule_target" {
  rule      = aws_cloudwatch_event_rule.lambda_schedule.name
  target_id = "lambda_target"
  arn       = aws_lambda_function.my_lambda.arn
}

resource "aws_lambda_permission" "allow_schedule" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_schedule.arn
}