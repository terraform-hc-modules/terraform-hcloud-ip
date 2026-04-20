provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_server" "target" {
  name = var.server_name
}

module "floating_ip" {
  source = "../../modules/floating-ip"

  name          = "app-floating-ip"
  type          = "ipv4"
  home_location = "fsn1"
  description   = "Floating IP for application cluster"

  create_assignment    = true
  assignment_server_id = data.hcloud_server.target.id

  delete_protection = true

  labels = {
    environment = "production"
    service     = "app"
    managed_by  = "terraform"
  }
}

module "rdns" {
  source = "../../modules/rdns"

  rdns_entries = [
    {
      dns_ptr        = "app.example.com"
      ip_address     = module.floating_ip.ip_address
      floating_ip_id = module.floating_ip.id
    }
  ]
}

output "floating_ip_address" {
  description = "Floating IP address"
  value       = module.floating_ip.ip_address
}

output "floating_ip_id" {
  description = "Floating IP ID"
  value       = module.floating_ip.id
}

output "assigned_server_id" {
  description = "Server ID the floating IP is assigned to"
  value       = module.floating_ip.server_id
}
