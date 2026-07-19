module "rds" {
    source = "github.com/Jagadeesh0606/Terraform/Task-5-18-07-Terraform--Source-Module"
    storage = 20
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    identifier = "my-rds-instance"
    username = "admin"
    password = "cloud123"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = true
}