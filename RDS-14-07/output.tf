output "rds_engine" {
  description = "Database Engine"
  value       = aws_db_instance.my_rds.engine
}

output "rds_engine_version" {
  description = "Database Engine Version"
  value       = aws_db_instance.my_rds.engine_version
}

output "rds_db_name" {
  description = "Database Name"
  value       = aws_db_instance.my_rds.db_name
}