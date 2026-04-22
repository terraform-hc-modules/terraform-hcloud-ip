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
# Floating IP (initial creation)
################################################################################

module "ip" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_floating_ip = true
  home_location      = "fsn1"

  # To move the floating IP between servers, set this to the destination server ID
  # and apply. See README.md in this example directory.
  floating_ip_server_id = null
}

output "floating_ip_id" {
  description = "Floating IP ID"
  value       = module.ip.floating_ip_id
}
