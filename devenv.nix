{ pkgs, lib, config, inputs, ... }:

{
  packages = [ 
    pkgs.git 
    pkgs.awscli2
    pkgs.kubectl
  ];

  languages.nix.enable = true;
  languages.terraform.enable = true;
}
