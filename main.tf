resource "github_membership" "veselyn" {
  username = "veselyn"
  role     = "admin"
}

module "github_repository" {
  source = "./modules/github-repository"

  for_each = {
    bootstrap-infra = {}
    homelab-infra   = {}
    issues          = { has_issues = true }
    issues-private  = { has_issues = true, visibility = "private" }
    org-infra       = {}
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

resource "tailscale_acl" "acl" {
  acl = <<-EOT
    // Example/default ACLs for unrestricted connections.
    {
      // Declare static groups of users. Use autogroups for all users or users with a specific role.
      // "groups": {
      //  	"group:example": ["alice@example.com", "bob@example.com"],
      // },

      // Define the tags which can be applied to devices and by which users.
      "tagOwners": {
        "tag:homelab-pve": ["autogroup:admin"],
      },

      // Define access control lists for users, groups, autogroups, tags,
      // Tailscale IP addresses, and subnet ranges.
      "acls": [
        // Allow all connections.
        // Comment this section out if you want to define specific restrictions.
        {"action": "accept", "src": ["*"], "dst": ["*:*"]},
      ],

      // Define users and devices that can use Tailscale SSH.
      "ssh": [
        // Allow all users to SSH into their own devices in check mode.
        // Comment this section out if you want to define specific restrictions.
        {
          "action": "check",
          "src":    ["autogroup:member"],
          "dst":    ["autogroup:self"],
          "users":  ["autogroup:nonroot", "root"],
        },
      ],
      "nodeAttrs": [
        {
          // Funnel policy, which lets tailnet members control Funnel
          // for their own devices.
          // Learn more at https://tailscale.com/kb/1223/tailscale-funnel/
          "target": ["autogroup:member"],
          "attr":   ["funnel"],
        },
      ],

      // Test access rules every time they're saved.
      // "tests": [
      //  	{
      //  		"src": "alice@example.com",
      //  		"accept": ["tag:example"],
      //  		"deny": ["100.101.102.103:443"],
      //  	},
      // ],
    }
  EOT
}

resource "tailscale_dns_configuration" "dns_configuration" {
  magic_dns          = true
  override_local_dns = true

  search_paths = [
    "homelab.veselabs.com",
    "veselabs.com",
  ]

  nameservers {
    address            = "2a07:a8c1::17:259e"
    use_with_exit_node = false
  }
}
