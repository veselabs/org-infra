variable "op_service_account_token" {
  type      = string
  ephemeral = true
  sensitive = true
}

# tflint-ignore: terraform_unused_declarations
variable "op_vault" {
  type = string
}
