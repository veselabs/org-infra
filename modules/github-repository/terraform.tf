terraform {
  required_version = "~> 1.12"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.9.0"
    }

    onepassword = {
      source  = "1Password/onepassword"
      version = "2.2.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }
  }
}
