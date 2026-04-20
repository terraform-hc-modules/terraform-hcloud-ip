output "id" {
  description = "ID of the floating IP."
  value       = try(hcloud_floating_ip.this[0].id, null)
}

output "ip_address" {
  description = "IP address."
  value       = try(hcloud_floating_ip.this[0].ip_address, null)
}

output "name" {
  description = "Name of the floating IP."
  value       = try(hcloud_floating_ip.this[0].name, null)
}

output "type" {
  description = "Type of the floating IP (ipv4 or ipv6)."
  value       = try(hcloud_floating_ip.this[0].type, null)
}

output "home_location" {
  description = "Home location of the floating IP."
  value       = try(hcloud_floating_ip.this[0].home_location, null)
}

output "server_id" {
  description = "Server ID the floating IP is assigned to (if any)."
  value       = try(hcloud_floating_ip.this[0].server_id, null)
}

output "assignment_id" {
  description = "ID of the floating IP assignment (if created)."
  value       = try(hcloud_floating_ip_assignment.this[0].id, null)
}
