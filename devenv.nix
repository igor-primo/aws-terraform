{ pkgs, lib, config, inputs, ... }:

{
  packages = [ 
    pkgs.git 
    pkgs.awscli2
    pkgs.kubectl
    pkgs.terraform-docs
  ];

  languages.nix.enable = true;
  languages.terraform.enable = true;

  enterShell = ''
    ARN=
    ARN=$(aws eks update-kubeconfig --region 'us-east-1' --name 'devopstraining-cluster' | awk '{print $3}')
    [ "$ARN" != "" ] && kubectl config set-context $ARN
  '';

  pre-commit.hooks.terraform-format.enable = true;
  pre-commit.hooks.terraform-validate = {
    enable = true;
    name = "Terraform Syntax Validation";
    entry = "terraform -chdir=aws-terraform validate";
    pass_filenames = false;
  };
  pre-commit.hooks.terraform-docs = {
    enable = true;
    name = "Terraform Docs automatic documentation generation";
    entry = "bash -c 'cd aws-terraform; terraform-docs markdown . --recursive --output-file README.md'";
  };
}
