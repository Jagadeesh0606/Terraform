provider "aws" {
  alias   = "root_account"
  profile = "default"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "user1_account"
  profile = "User-1"
  region  = "us-west-2"
}