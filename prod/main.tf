terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.90.0"
    }
  }
  backend "s3" {
    bucket         = "ap-southeast2-tf-state-891988165081"
    key            = "prod"
    region         = "ap-southeast-2"
    dynamodb_table = "sydney-terraform-state-lock-891988165081 "
    encrypt        = true

  }
}
provider "snowflake" {
  account     = "KVISTNV.SU33938"
  username    = "ADMIN"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  schema              = var.schema
  env_name            = var.env_name
}