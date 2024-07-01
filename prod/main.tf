terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
  backend "s3" {
    bucket         = "ap-southeast2-tf-state-058264307215"
    key            = "prod"
    region         = "ap-southeast-2"
    dynamodb_table = "sydney-terraform-state-lock-058264307215"
    encrypt        = true

  }
}
provider "snowflake" {
  account       = var.snowflake_account
  user          = var.snowflake_user
  authenticator = "JWT"
  role          = "ACCOUNTADMIN"
  private_key   = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  schema              = var.schema
  env_name            = var.env_name
}