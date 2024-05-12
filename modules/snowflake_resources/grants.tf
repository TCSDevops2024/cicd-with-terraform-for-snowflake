resource "snowflake_database_grant" "db_ro_grant" {
  database_name = snowflake_database.tf_database.name
  privilege     = "USAGE"
  roles         = ["TF_READER"]
}

resource "snowflake_schema_grant" "schema_ro_grant" {
  database_name = snowflake_database.tf_database.name
  schema_name   = snowflake_schema.tf_schema.name
  privilege     = "USAGE"
  roles         = ["TF_READER"]
}

resource "snowflake_table_grant" "table_ro_grant" {
  database_name     = snowflake_database.tf_database.name
  schema_name       = snowflake_schema.tf_schema.name
  privilege         = "SELECT"
  roles             = ["TF_READER"]
  on_future         = true
  with_grant_option = false
  on_all            = false
}

resource "snowflake_view_grant" "view_ro_grant" {
  database_name     = snowflake_database.tf_database.name
  schema_name       = snowflake_schema.tf_schema.name
  privilege         = "SELECT"
  roles             = ["TF_READER"]
  on_future         = true
  with_grant_option = false
  on_all            = false
}

resource "snowflake_warehouse_grant" "warehouse_grant" {
  warehouse_name = snowflake_warehouse.tf_warehouse.name
  privilege      = "USAGE"
  roles          = ["TF_READER"]
}