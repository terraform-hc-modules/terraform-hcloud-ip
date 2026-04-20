provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"
  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-ip"
    GithubOrg  = "terraform-hc-modules"
  }
}

module "primary_ip" {
  source = "../../modules/primary-ip"

  name   = local.name
  type   = "ipv4"
  labels = local.tags
}
