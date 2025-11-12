provider "github" {
  owner = "veselabs"
  app_auth {}
}

provider "onepassword" {
  service_account_token = var.op_service_account_token
}
