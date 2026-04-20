output "primary_ip_id" {
  description = "ID of the primary IP."
  value       = module.primary_ip.id
}

output "primary_ip_address" {
  description = "Primary IP address."
  value       = module.primary_ip.ip_address
}

output "floating_ip_id" {
  description = "ID of the floating IP."
  value       = module.floating_ip.id
}

output "floating_ip_address" {
  description = "Floating IP address."
  value       = module.floating_ip.ip_address
}

output "primary_ip" {
  description = "Primary IP details."
  value = {
    id            = module.primary_ip.id
    name          = module.primary_ip.name
    ip_address    = module.primary_ip.ip_address
    type          = module.primary_ip.type
    assignee_type = module.primary_ip.assignee_type
    assignee_id   = module.primary_ip.assignee_id
    datacenter    = module.primary_ip.datacenter
  }
}

output "floating_ip" {
  description = "Floating IP details."
  value = {
    id            = module.floating_ip.id
    name          = module.floating_ip.name
    ip_address    = module.floating_ip.ip_address
    type          = module.floating_ip.type
    home_location = module.floating_ip.home_location
    server_id     = module.floating_ip.server_id
    assignment_id = module.floating_ip.assignment_id
  }
}
