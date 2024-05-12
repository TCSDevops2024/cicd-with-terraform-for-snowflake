resource "snowflake_grant_privileges_to_account_roles" "db_ro_grant" {
  roles = ["TF_READER"]
  privileges {
    privilege = "USAGE"
    on_account_object {
      object_type = "DATABASE"
      database_name = snowflake_database.tf_database.name
    }
  }
}

resource "snowflake_grant_privileges_to_account_roles" "schema_ro_grant" {
  roles = ["TF_READER"]
  privileges {
    privilege = "USAGE"
    on_account_object {
      object_type = "SCHEMA"
      database_name = snowflake_database.tf_database.name
      schema_name = snowflake_schema.tf_schema.name
    }
  }
}

resource "snowflake_grant_privileges_to_account_roles"  "table_ro_grant" {
  roles = ["TF_READER"]
  privileges {
    privilege = "SELECT"
    on_account_object {
      object_type = "TABLE"
      database_name = snowflake_database.tf_database.name
      schema_name = snowflake_schema.tf_schema.name
      table_name = snowflake_table.tf_table.name
    }
  }
}

resource "snowflake_grant_privileges_to_account_roles"  "view_ro_grant" {
  roles = ["TF_READER"]
  privileges {
    privilege = "SELECT"
    on_account_object {
      object_type = "VIEW"
      database_name = snowflake_database.tf_database.name
      schema_name = snowflake_schema.tf_schema.name
      view_name = snowflake_view.tf_view.name
    }
  }
}

resource "snowflake_grant_privileges_to_account_roles"  "warehouse_grant" {
  roles = ["TF_READER"]
  privileges {
    privilege = "USAGE"
    on_account_object {
      object_type = "WAREHOUSE"
      warehouse_name = snowflake_warehouse.tf_warehouse.name
    }
  }
}