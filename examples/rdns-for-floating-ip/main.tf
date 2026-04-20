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
# Floating IP + rDNS
################################################################################

module "ip" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_floating_ip = true
  home_location      = "fsn1"
}

module "floating_ip_rdns" {
  source = "../../modules/rdns"

  floating_ip_id = module.ip.floating_ip_id
  ip_address     = module.ip.floating_ip_address
  dns_ptr        = "floating01.example.com"
}

output "floating_ip_address" {
  description = "Floating IP address"
  value       = module.ip.floating_ip_address
}
