output "primary_ip" {
  value = module.ip.primary_ip_address
}

output "floating_ip" {
  value = module.ip.floating_ip_address
}
