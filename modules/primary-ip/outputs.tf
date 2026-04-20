output "id" {
  description = "ID of the primary IP."
  value       = try(hcloud_primary_ip.this[0].id, null)
}

output "ip_address" {
  description = "IP address."
  value       = try(hcloud_primary_ip.this[0].ip_address, null)
}

output "name" {
  description = "Name of the primary IP."
  value       = try(hcloud_primary_ip.this[0].name, null)
}

output "type" {
  description = "Type of the primary IP (ipv4 or ipv6)."
  value       = try(hcloud_primary_ip.this[0].type, null)
}

output "assignee_type" {
  description = "Assignee type."
  value       = try(hcloud_primary_ip.this[0].assignee_type, null)
}

output "assignee_id" {
  description = "Assignee ID."
  value       = try(hcloud_primary_ip.this[0].assignee_id, null)
}

output "datacenter" {
  description = "Datacenter name."
  value       = try(hcloud_primary_ip.this[0].datacenter, null)
}
