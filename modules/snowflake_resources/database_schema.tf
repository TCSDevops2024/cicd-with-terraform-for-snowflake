resource "snowflake_database" "tf_database" {
  name                        = var.database
  comment                     = "Database for ${var.env_name}"
  data_retention_time_in_days = var.time_travel_in_days

}

resource "snowflake_schema" "tf_schema" {
  name     = var.schema
  database = snowflake_database.tf_database.name
  comment  = "Schema for ${var.env_name}"
}