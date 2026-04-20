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
# Primary IP associated to a server (via submodule)
################################################################################

module "primary_ip" {
  source = "../../modules/primary-ip"

  name        = "${local.name}-primary"
  type        = "ipv4"
  datacenter  = "fsn1-dc14"
  assignee_id = module.compute.server_id
  labels      = local.tags
}

output "primary_ip_address" {
  description = "Primary IP address"
  value       = module.primary_ip.ip_address
}
