module "primary_ip" {
  source = "./modules/primary-ip"

  create            = var.create_primary_ip
  name              = coalesce(var.primary_ip_name, "${var.name}-primary")
  type              = var.primary_ip_type
  datacenter        = var.datacenter
  auto_delete       = var.auto_delete
  delete_protection = var.delete_protection
  labels            = var.labels
}

module "floating_ip" {
  source = "./modules/floating-ip"

  create            = var.create_floating_ip
  name              = coalesce(var.floating_ip_name, "${var.name}-floating")
  type              = var.floating_ip_type
  home_location     = var.home_location
  server_id         = var.floating_ip_server_id
  delete_protection = var.delete_protection
  labels            = var.labels
}
