resource "snowflake_table" "tf_table" {
  database   = snowflake_database.tf_database.name
  schema     = snowflake_schema.tf_schema.name
  depends_on = [snowflake_grant_privileges_to_account_role.table_ro_grant]
  comment    = "Table for ${var.env_name}"
  name       = "MENU"
  column {
    name    = "MENU_ID"
    type    = "NUMBER"
    comment = "Unique Identifier"
  }
  column {
    name = "MENU_TYPE_ID"
    type = "NUMBER"
  }
  column {
    name = "MENU_TYPE"
    type = "STRING"
  }
  column {
    name = "TRUCK_BRAND_NAME"
    type = "STRING"
  }
  column {
    name = "MENU_ITEM_ID"
    type = "NUMBER"
  }
  column {
    name = "MENU_ITEM_NAME"
    type = "STRING"
  }
  column {
    name = "ITEM_CATEGORY"
    type = "STRING"
  }
  column {
    name = "ITEM_SUBCATEGORY"
    type = "STRING"
  }
  column {
    name = "COST_OF_GOODS_USD"
    type = "NUMBER"
  }
  column {
    name = "SALE_PRICE_USD"
    type = "NUMBER"
  }
  column {
    name = "MENU_ITEM_HEALTH_METRICS_OBJ"
    type = "VARIANT"
  }
}