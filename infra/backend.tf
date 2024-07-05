terraform {
  backend "s3" {
    bucket = "mscc-crc-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "mscc-crc-tf-lock-table"
  }
}

data "terraform_remote_state" "state" {
  backend = "s3"
  config = {
    bucket = "mscc-crc-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
