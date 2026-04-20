resource "hcloud_floating_ip" "this" {
  count = var.create ? 1 : 0

  name              = var.name
  type              = var.type
  home_location     = var.home_location
  server_id         = var.server_id
  delete_protection = var.delete_protection
  labels            = var.labels
  description       = var.description
}

resource "hcloud_floating_ip_assignment" "this" {
  count = var.create && var.server_id != null ? 1 : 0

  floating_ip_id = hcloud_floating_ip.this[0].id
  server_id      = var.server_id
}
