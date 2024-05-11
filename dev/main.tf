terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.90.0"
    }
  }
  backend "s3" {
    bucket  = "<your-bucket-name>e"
    key     = "<your-key>"
    region  = "ap-southeast-2"
    dynamodb_table = "value"
    encrypt = true

  }
}
provider "snowflake" {
  account     = "<your-account>"
  username    = "<your-username>"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "./modules/snowflake"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}