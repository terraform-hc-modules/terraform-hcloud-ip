resource "hcloud_rdns" "server" {
  count = var.create && var.server_id != null ? 1 : 0

  server_id  = var.server_id
  ip_address = var.ip_address
  dns_ptr    = var.dns_ptr
}

resource "hcloud_rdns" "floating_ip" {
  count = var.create && var.floating_ip_id != null ? 1 : 0

  floating_ip_id = var.floating_ip_id
  ip_address     = var.ip_address
  dns_ptr        = var.dns_ptr
}

resource "hcloud_rdns" "primary_ip" {
  count = var.create && var.primary_ip_id != null ? 1 : 0

  primary_ip_id = var.primary_ip_id
  ip_address    = var.ip_address
  dns_ptr       = var.dns_ptr
}

resource "hcloud_rdns" "load_balancer" {
  count = var.create && var.load_balancer_id != null ? 1 : 0

  load_balancer_id = var.load_balancer_id
  ip_address       = var.ip_address
  dns_ptr          = var.dns_ptr
}
