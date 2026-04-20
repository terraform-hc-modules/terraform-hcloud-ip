variable "create" {
  description = "Whether to create the rDNS entry."
  type        = bool
  default     = true
}

variable "server_id" {
  description = "Server ID (mutually exclusive with other IDs)."
  type        = number
  default     = null

  validation {
    condition     = var.server_id == null || var.server_id > 0
    error_message = "If set, 'server_id' must be a positive number."
  }
}

variable "floating_ip_id" {
  description = "Floating IP ID."
  type        = number
  default     = null

  validation {
    condition     = var.floating_ip_id == null || var.floating_ip_id > 0
    error_message = "If set, 'floating_ip_id' must be a positive number."
  }
}

variable "primary_ip_id" {
  description = "Primary IP ID."
  type        = number
  default     = null

  validation {
    condition     = var.primary_ip_id == null || var.primary_ip_id > 0
    error_message = "If set, 'primary_ip_id' must be a positive number."
  }
}

variable "load_balancer_id" {
  description = "Load Balancer ID."
  type        = number
  default     = null

  validation {
    condition     = var.load_balancer_id == null || var.load_balancer_id > 0
    error_message = "If set, 'load_balancer_id' must be a positive number."
  }
}

variable "ip_address" {
  description = "IP address to set rDNS for."
  type        = string

  validation {
    condition = (
      can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", trimspace(var.ip_address))) ||
      can(regex("^([0-9a-fA-F]{0,4}:){2,7}[0-9a-fA-F]{0,4}$", trimspace(var.ip_address)))
    )
    error_message = "The 'ip_address' must be a valid IPv4 or IPv6 address."
  }
}

variable "dns_ptr" {
  description = "DNS pointer record."
  type        = string

  validation {
    condition     = length(trimspace(var.dns_ptr)) > 0
    error_message = "The 'dns_ptr' must not be empty."
  }
}

variable "strict_id_validation" {
  description = "Whether to strictly validate that exactly one of server_id, floating_ip_id, primary_ip_id, or load_balancer_id is set when create=true."
  type        = bool
  default     = true
}

locals {
  _rdns_target_ids = [
    var.server_id,
    var.floating_ip_id,
    var.primary_ip_id,
    var.load_balancer_id,
  ]
}

resource "terraform_data" "validate" {
  count = var.create && var.strict_id_validation ? 1 : 0

  lifecycle {
    precondition {
      condition     = length([for v in local._rdns_target_ids : v if v != null]) == 1
      error_message = "Exactly one of 'server_id', 'floating_ip_id', 'primary_ip_id', or 'load_balancer_id' must be set when create=true."
    }
  }
}
