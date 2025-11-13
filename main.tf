resource "github_membership" "veselyn" {
  username = "veselyn"
  role     = "admin"
}

module "github_repositories" {
  source = "./modules/github-repository"

  for_each = {
    bootstrap-infra = { visibility = "private" }
    homelab-infra   = { visibility = "private" }
    issues          = { has_issues = true }
    issues-private  = { has_issues = true, visibility = "private" }
    org-infra       = { visibility = "private" }
  }

  name           = each.key
  visibility     = try(each.value.visibility, "public")
  archived       = try(each.value.archived, false)
  default_branch = local.default_branch
  has_issues     = try(each.value.has_issues, false)
  environments   = try(each.value.environments, [])
}

resource "tailscale_tailnet_settings" "tailnet_settings" {
  acls_external_link                          = null
  acls_externally_managed_on                  = false
  devices_approval_on                         = true
  devices_auto_updates_on                     = false
  devices_key_duration_days                   = 180
  https_enabled                               = true
  network_flow_logging_on                     = false
  posture_identity_collection_on              = false
  regional_routing_on                         = false
  users_approval_on                           = true
  users_role_allowed_to_join_external_tailnet = "admin"
}
