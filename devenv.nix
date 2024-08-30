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
}
