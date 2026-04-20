provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-ip"
    GithubOrg  = "terraform-hc-modules"
  }
}

################################################################################
# IP Module - Primary IP Only
################################################################################

module "primary_ip" {
  source = "../../modules/primary-ip"

  name       = local.name
  type       = "ipv4"
  datacenter = "fsn1-dc14"
  labels     = local.tags

  auto_delete = false
}

output "primary_ip_id" {
  value = module.primary_ip.id
}

output "primary_ip_address" {
  value = module.primary_ip.ip_address
}
