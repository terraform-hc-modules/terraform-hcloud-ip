module "wrapper" {
  source   = "../"
  for_each = var.items

  name   = try(each.value.name, each.key)
  labels = try(each.value.labels, {})

  create_primary_ip = try(each.value.create_primary_ip, false)
  primary_ip_type   = try(each.value.primary_ip_type, "ipv4")

  create_floating_ip    = try(each.value.create_floating_ip, false)
  floating_ip_type      = try(each.value.floating_ip_type, "ipv4")
  home_location         = try(each.value.home_location, "fsn1")
  floating_ip_server_id = try(each.value.floating_ip_server_id, null)
}

variable "items" {
  type    = any
  default = {}
}

output "wrapper" {
  value = module.wrapper
}
