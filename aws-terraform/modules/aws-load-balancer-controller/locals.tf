locals {
  oidc = element(split("/", var.oidc), length(split("/", var.oidc)) - 1)
}