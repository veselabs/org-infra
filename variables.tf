variable "op_service_account_token" {
  type      = string
  ephemeral = true
  sensitive = true
}

variable "op_vault" {
  type = string
}
