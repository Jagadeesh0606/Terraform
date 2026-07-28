# variable "aws_region" {
#   description = "The region in which to create the infrastructure"
#   type        = string
#   nullable    = false
#   default     = "us-west-2" #here we need to define either us-west-1 or eu-west-2 if i give other region will get error 
#   validation {
#     condition = var.aws_region == "us-east-1" || var.aws_region == "ap-south-1"
#     error_message = "The variable 'aws_region' must be one of the following regions: us-east-1, ap-south-1"
#   }
# }


# provider "aws" {
#   region = var.aws_region
  
   
#  }

#  resource "aws_s3_bucket" "dev" {
#     bucket = "statefile-configuresss"
    
    
# }

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  nullable    = false
  default     = "t2.medium"

  validation {
    condition = contains(
      ["t2.micro", "t3.micro", "t3.small"],
      var.instance_type
    )

    error_message = "Valid instance types are: t2.micro, t3.micro, or t3.small."
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0b826bb6d96d2afe4" # Replace with a valid AMI for your region
  instance_type = var.instance_type

  tags = {
    Name = "Validation-Practice"
  }
}