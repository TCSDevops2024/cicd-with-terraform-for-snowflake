resource "snowflake_warehouse" "tf_warehouse" {
  name           = var.env_name == "PROD" ? "PROD_WH" : "DEV_WH"
  comment        = "Warehouse for ${var.env_name}"
  warehouse_size = var.env_name == "PROD" ? "SMALL" : "XSSMALL"
  auto_suspend   = 1
  auto_resume    = true
}