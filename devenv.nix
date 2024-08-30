{ pkgs, lib, config, inputs, ... }:

{
  packages = [ 
    pkgs.git 
    pkgs.awscli2
    pkgs.kubectl
  ];

  languages.nix.enable = true;
  languages.terraform.enable = true;

  pre-commit.hooks.terraform-format.enable = true;
  pre-commit.hooks.terraform-validate = {
    enable = true;
    name = "Terraform Syntax Validation";
    entry = "terraform -chdir=aws-terraform validate";
    pass_filenames = false;
  }
}
