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
