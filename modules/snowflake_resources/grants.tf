resource "snowflake_grant_privileges_to_account_role" "db_ro_grant" {
  privileges        = ["USAGE"]
  account_role_name = "TF_READER"
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_database.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "schema_ro_grant" {
  privileges        = ["USAGE"]
  account_role_name = "TF_READER"
  on_schema {
      all_schemas_in_database = snowflake_database.tf_database.name
    }
}


resource "snowflake_grant_privileges_to_account_role" "table_ro_grant" {
  privileges        = ["SELECT"]
  account_role_name = "TF_READER"
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = snowflake_database.tf_database.name
    }
  }
}


resource "snowflake_grant_privileges_to_account_role" "view_ro_grant" {
  privileges        = ["SELECT"]
  account_role_name = "TF_READER"
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = snowflake_database.tf_database.name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "warehouse_grant" {
  privileges        = ["USAGE"]
  account_role_name = "TF_READER"
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.tf_warehouse.name
  }
}
