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
# Supporting Resources
################################################################################

module "compute" {
  source  = "terraform-hc-modules/compute/hcloud"
  version = "~> 0.1"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags
}

################################################################################
# IP Module - Floating IP Assigned to Server
################################################################################

module "ip" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_floating_ip    = true
  home_location         = "fsn1"
  floating_ip_server_id = module.compute.server_id
}

output "floating_ip_address" {
  description = "Floating IP address"
  value       = module.ip.floating_ip_address
}
