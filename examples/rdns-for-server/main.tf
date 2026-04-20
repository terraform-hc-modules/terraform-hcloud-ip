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
# rDNS for a server IP
################################################################################

module "server_rdns" {
  source = "../../modules/rdns"

  server_id  = module.compute.server_id
  ip_address = module.compute.server_ipv4_address
  dns_ptr    = "host01.example.com"
}

output "server_id" {
  description = "Server ID"
  value       = module.compute.server_id
}
