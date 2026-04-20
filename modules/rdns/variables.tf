variable "create" {
  description = "Whether to create the rDNS entry."
  type        = bool
  default     = true
}

variable "server_id" {
  description = "Server ID (mutually exclusive with other IDs)."
  type        = number
  default     = null
}

variable "floating_ip_id" {
  description = "Floating IP ID."
  type        = number
  default     = null
}

variable "primary_ip_id" {
  description = "Primary IP ID."
  type        = number
  default     = null
}

variable "load_balancer_id" {
  description = "Load Balancer ID."
  type        = number
  default     = null
}

variable "ip_address" {
  description = "IP address to set rDNS for."
  type        = string
}

variable "dns_ptr" {
  description = "DNS pointer record."
  type        = string
}
