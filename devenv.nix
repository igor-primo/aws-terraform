{ pkgs, lib, config, inputs, ... }:

{
  packages = [ 
    pkgs.git 
    pkgs.awscli2
    pkgs.kubectl
  ];

  languages.nix.enable = true;
  languages.terraform.enable = true;

  enterShell = ''
    ARN=$(aws eks update-kubeconfig --region 'us-east-1' --name 'devopstraining-cluster' | awk '{print $3}')
    kubectl config set-context $ARN
  '';

  pre-commit.hooks.terraform-format.enable = true;
  pre-commit.hooks.terraform-validate = {
    enable = true;
    name = "Terraform Syntax Validation";
    entry = "terraform -chdir=aws-terraform validate";
    pass_filenames = false;
  };
}
