variable "database" {
  type    = string
  default = "TASTY_BYTES_SAMPLE_DATA_DEV"
}

variable "schema" {
  type    = string
  default = "RAW_POS"
}

variable "env_name" {
  type    = string
  default = "DEV"
}

variable "snowflake_private_key" {
  type        = string
  description = "Private key used to access Snowflake"
  sensitive   = true
}