{
  description = "org-infra";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    devenv.url = "github:cachix/devenv/v2.0";
    treefmt-nix.url = "github:numtide/treefmt-nix/main";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux"];

      perSystem = {
        pkgs,
        system,
        ...
      }: {
        devShells.default = inputs.devenv.lib.mkShell {
          inherit inputs pkgs;

          modules = [
            {
              env = {
                CLOUDFLARE_ACCESS_KEY_ID = "op://veselabs/cloudflare api token/access_key_id";
                CLOUDFLARE_ACCOUNT_ID = "op://veselabs/cloudflare api token/account_id";
                CLOUDFLARE_SECRET_ACCESS_KEY = "op://veselabs/cloudflare api token/secret_access_key";
                GITHUB_APP_ID = "op://veselabs/github app organization/id";
                GITHUB_APP_INSTALLATION_ID = "op://veselabs/github app organization/installation_id";
                GITHUB_APP_PEM_FILE = "op://veselabs/github app private key/private key";
                TAILSCALE_OAUTH_CLIENT_ID = "op://veselabs/tailscale oauth credentials/username";
                TAILSCALE_OAUTH_CLIENT_SECRET = "op://veselabs/tailscale oauth credentials/credential";
                TF_VAR_op_service_account_token = "op://veselabs/service account auth token/credential";
                TF_VAR_op_vault = "op://veselabs/service account auth token/username";
              };

              languages = {
                nix.enable = true;
                terraform.enable = true;
              };

              packages = builtins.attrValues {
                inherit
                  (pkgs)
                  _1password-cli
                  envsubst
                  just
                  pre-commit
                  terraform-docs
                  ;
              };

              treefmt = {
                enable = true;
                config = {
                  programs = {
                    alejandra.enable = true;
                    prettier.enable = true;
                    terraform.enable = true;
                    terraform.package = pkgs.terraform;
                  };
                };
              };

              git-hooks.hooks = {
                deadnix.enable = true;
                end-of-file-fixer.enable = true;
                statix.enable = true;
                terraform-docs = {
                  enable = true;
                  entry = "just check-docs";
                  files = "\\.tf$";
                  pass_filenames = false;
                };
                tflint.enable = true;
                treefmt.enable = true;
                trim-trailing-whitespace.enable = true;
                yamllint.enable = true;
              };
            }
          ];
        };

        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
    };
}
