output "RDS-Endpoint" {
    value = aws_db_instance.name.endpoint
  
}

output "RDS-Replication-Endpoint" {
    value = aws_db_instance.replica.endpoint
}

output "Elastic-cache-Endpoint" {
    value = aws_elasticache_cluster.Redis-cache.cache_nodes[0].address
}