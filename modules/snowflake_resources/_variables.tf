variable "database" {
  type = string
}

variable "schema" {
  type = string
}


variable "env_name" {
  type = string
}

variable "time_travel_in_days" {
  type    = number
  default = "Number of days configured for time travel"
}