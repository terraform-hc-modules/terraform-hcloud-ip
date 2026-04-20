provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"
  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-ip"
    GithubOrg  = "terraform-hc-modules"
  }
}

module "ip" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_primary_ip = true
  primary_ip_type   = "ipv4"

  create_floating_ip = true
  floating_ip_type   = "ipv4"
  home_location      = "fsn1"
}
