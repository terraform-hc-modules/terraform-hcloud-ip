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
# IP Module - Floating IP Only
################################################################################

module "ip" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_floating_ip = true
  home_location      = "fsn1"
}

output "floating_ip_id" {
  description = "ID of the floating IP"
  value       = module.ip.floating_ip_id
}

output "floating_ip_address" {
  description = "Floating IP address"
  value       = module.ip.floating_ip_address
}
