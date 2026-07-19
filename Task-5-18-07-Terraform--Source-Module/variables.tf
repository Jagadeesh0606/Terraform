variable "storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
}

variable "engine" {
  description = "The database engine to use for the RDS instance"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "The version of the database engine to use for the RDS instance"
  type        = string
  default     = ""
}

variable "instance_class" {
  description = "The instance class to use for the RDS instance"
  type        = string
  default     = ""
}

variable "identifier" {
  description = "The identifier for the RDS instance"
  type        = string
  default     = ""
}

variable "username" {
  description = "The username for the RDS instance"
  type        = string
  default     = ""
}

variable "password" {
  description = "The password for the RDS instance"
  type        = string
  default     = ""
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group to associate with the RDS instance"
  type        = string
  default     = ""
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the RDS instance"
  type        = bool
}
