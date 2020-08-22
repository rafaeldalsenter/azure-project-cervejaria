variable "tags" {
  type = "map"
  default = {
    "environment" = "example-terraform"
  }
}

variable "mysql_user" {
  default = "sa"
}

variable "mysql_password" {
  default = "default_password"
}
