provider "github" {
  owner = "veselabs"
  app_auth {}
}

locals {
  default_branch = "master"
}

resource "github_membership" "veselyn" {
  username = "veselyn"
  role     = "admin"
}

module "github_repositories" {
  source = "./modules/github-repository"

  for_each = {
    ansible-homelab     = { visibility = "private" }
    issues              = { has_issues = true }
    issues-private      = { has_issues = true, visibility = "private" }
    packer-homelab      = { visibility = "private" }
    terraform-aws       = { visibility = "private" }
    terraform-bootstrap = {}
    terraform-github    = {}
    terraform-homelab   = { visibility = "private" }

    bootstrap-infrastructure    = { visibility = "private" }
    organization-infrastructure = { visibility = "private" }
    homelab-infrastructure      = { visibility = "private" }
  }

  name           = each.key
  visibility     = try(each.value.visibility, "public")
  archived       = try(each.value.archived, false)
  default_branch = local.default_branch
  has_issues     = try(each.value.has_issues, false)
  environments   = try(each.value.environments, [])
}
