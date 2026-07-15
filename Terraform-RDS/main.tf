resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my-vpc"
    }
  
}

resource "aws_subnet" "subent-1" {
    vpc_id     = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "my-subnet-1"
    }
}

resource "aws_subnet" "subnet-2" {
    vpc_id     = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "my-subnet-2"
    }
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
    name       = "my-db-subnet-group"
    subnet_ids = [aws_subnet.subent-1.id, aws_subnet.subnet-2.id]
  
    tags = {
        Name = "my-db-subnet-group"
    }
}

resource "aws_security_group" "name" {
    name        = "my-security-group"
    description = "Allow MySQL traffic"
    vpc_id      = aws_vpc.name.id

    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = [aws_vpc.name.cidr_block]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [aws_vpc.name.cidr_block]
    }

}

resource "aws_db_instance" "name" {
    allocated_storage    = 20
    identifier          = "my-rds-instance"
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t3.micro"
    storage_type         = "gp2"
    db_name              = "mydatabase"
    username             = "admin"
    password             = "Password123!"
    db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
    vpc_security_group_ids = [aws_security_group.name.id]
    publicly_accessible   = false
    skip_final_snapshot = true
    backup_retention_period = 7
  
}

resource "aws_db_instance" "replica" {
    identifier              = "my-rds-replica"
    engine                  = "mysql"
    instance_class          = "db.t3.micro"
    publicly_accessible     = false
    replicate_source_db     = aws_db_instance.name.arn
    db_subnet_group_name    = aws_db_subnet_group.my_db_subnet_group.name
    vpc_security_group_ids  = [aws_security_group.name.id]
    skip_final_snapshot     = true
}

resource "aws_elasticache_subnet_group" "my_cache_subnet_group" {
  name       = "my-cache-subnet-group"
  subnet_ids = [aws_subnet.subent-1.id, aws_subnet.subnet-2.id]
}

resource "aws_elasticache_cluster" "Redis-cache" {
  cluster_id         = "my-elasticache-cluster"
  engine             = "redis"
  node_type          = "cache.t3.micro"
  num_cache_nodes    = 1
  security_group_ids = [aws_security_group.name.id]
  subnet_group_name  = aws_elasticache_subnet_group.my_cache_subnet_group.name
}
