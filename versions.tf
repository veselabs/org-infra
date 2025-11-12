terraform {
  required_version = "~> 1.12"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }

    onepassword = {
      source  = "1Password/onepassword"
      version = "2.2.0"
    }

    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.24.0"
    }
  }
}
