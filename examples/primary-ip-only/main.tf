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

module "ip" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_primary_ip = true
  datacenter        = "fsn1-dc14"
  auto_delete       = false
}

output "primary_ip_id" {
  description = "ID of the primary IP"
  value       = module.ip.primary_ip_id
}

output "primary_ip_address" {
  description = "Primary IP address"
  value       = module.ip.primary_ip_address
}
