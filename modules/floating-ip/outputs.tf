output "id" {
  description = "ID of the floating IP."
  value       = try(hcloud_floating_ip.this[0].id, null)
}

output "ip_address" {
  description = "IP address."
  value       = try(hcloud_floating_ip.this[0].ip_address, null)
}
