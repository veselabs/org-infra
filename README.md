# org-infra

This Terraform configuration manages high-level infrastructure for the
organization.

## Getting started

### Prerequisites

Nix is fundamental to use this repository. Please install Nix by following the
[instructions](https://nixos.org/download).

### Installation

If you're using `direnv`, grant it permission to load the `.envrc` file and
enter the development environment automatically when changing to the project's
directory:

```sh
direnv allow
```

Otherwise, enter the development environment manually:

```sh
nix develop --impure
```

## Usage

The development environment has variables set to 1Password secret references.

To load the secrets in a temporary shell:

```sh
op run --no-masking $SHELL
```

To run an ad-hoc command with the secrets loaded:

```sh
op run --no-masking <command>...
```

Typically, you'd want to initialize the Terraform configuration and then apply
it:

```sh
terraform init
terraform apply
```

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
