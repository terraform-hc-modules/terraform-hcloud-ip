output "id" {
  description = "ID of the primary IP."
  value       = try(hcloud_primary_ip.this[0].id, null)
}

output "ip_address" {
  description = "IP address."
  value       = try(hcloud_primary_ip.this[0].ip_address, null)
}
