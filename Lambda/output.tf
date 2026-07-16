output "lambda_function_arn" {
    value = aws_lambda_function.my_lambda.arn
}

output "lambda_function_name" {
    value = aws_lambda_function.my_lambda.function_name
}

output "s3_bucket_name" {
    value = aws_s3_bucket.lambda_bucket.bucket
}

output "s3_object_key" {
    value = aws_s3_object.lambda_zip.key
}

output "cloudwatch_event_rule_arn" {
    value = aws_cloudwatch_event_rule.lambda_schedule.arn
}

output "cloudwatch_schedule_expression" {
    value = aws_cloudwatch_event_rule.lambda_schedule.schedule_expression
}