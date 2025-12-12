# org-infra

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.12 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.9.0 |
| <a name="requirement_onepassword"></a> [onepassword](#requirement\_onepassword) | 2.2.0 |
| <a name="requirement_tailscale"></a> [tailscale](#requirement\_tailscale) | 0.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.9.0 |
| <a name="provider_tailscale"></a> [tailscale](#provider\_tailscale) | 0.24.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_repository"></a> [github\_repository](#module\_github\_repository) | ./modules/github-repository | n/a |

## Resources

| Name | Type |
|------|------|
| [github_membership.veselyn](https://registry.terraform.io/providers/integrations/github/6.9.0/docs/resources/membership) | resource |
| [tailscale_acl.acl](https://registry.terraform.io/providers/tailscale/tailscale/0.24.0/docs/resources/acl) | resource |
| [tailscale_dns_configuration.dns_configuration](https://registry.terraform.io/providers/tailscale/tailscale/0.24.0/docs/resources/dns_configuration) | resource |
| [tailscale_tailnet_settings.tailnet_settings](https://registry.terraform.io/providers/tailscale/tailscale/0.24.0/docs/resources/tailnet_settings) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_op_service_account_token"></a> [op\_service\_account\_token](#input\_op\_service\_account\_token) | n/a | `string` | n/a | yes |
| <a name="input_op_vault"></a> [op\_vault](#input\_op\_vault) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
