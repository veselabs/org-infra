# organization-infrastructure

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.12 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |
| <a name="requirement_tailscale"></a> [tailscale](#requirement\_tailscale) | 0.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.6.0 |
| <a name="provider_tailscale"></a> [tailscale](#provider\_tailscale) | 0.24.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_repositories"></a> [github\_repositories](#module\_github\_repositories) | ./modules/github-repository | n/a |

## Resources

| Name | Type |
|------|------|
| [github_membership.veselyn](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership) | resource |
| [tailscale_tailnet_settings.settings](https://registry.terraform.io/providers/tailscale/tailscale/0.24.0/docs/resources/tailnet_settings) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
