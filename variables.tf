variable "name" {
  description = "Name prefix for resources."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The 'name' must not be empty."
  }
}

variable "labels" {
  description = "Labels to apply."
  type        = map(string)
  default     = {}
}

variable "delete_protection" {
  description = "Enable delete protection."
  type        = bool
  default     = false
}

variable "create_primary_ip" {
  description = "Whether to create a primary IP."
  type        = bool
  default     = false
}

variable "primary_ip_name" {
  description = "Name of the primary IP."
  type        = string
  default     = null

  validation {
    condition     = var.primary_ip_name == null || length(trimspace(var.primary_ip_name)) > 0
    error_message = "If set, 'primary_ip_name' must not be empty."
  }
}

variable "primary_ip_type" {
  description = "Type of primary IP."
  type        = string
  default     = "ipv4"

  validation {
    condition     = contains(["ipv4", "ipv6"], lower(var.primary_ip_type))
    error_message = "The 'primary_ip_type' must be one of: ipv4, ipv6."
  }
}

variable "datacenter" {
  description = "Datacenter for primary IP."
  type        = string
  default     = null

  validation {
    condition     = !var.create_primary_ip || (var.datacenter != null && length(trimspace(var.datacenter)) > 0)
    error_message = "When 'create_primary_ip' is true, 'datacenter' must be set (e.g., fsn1-dc14)."
  }
}

variable "auto_delete" {
  description = "Auto delete primary IP."
  type        = bool
  default     = false
}

variable "create_floating_ip" {
  description = "Whether to create a floating IP."
  type        = bool
  default     = false
}

variable "floating_ip_name" {
  description = "Name of the floating IP."
  type        = string
  default     = null

  validation {
    condition     = var.floating_ip_name == null || length(trimspace(var.floating_ip_name)) > 0
    error_message = "If set, 'floating_ip_name' must not be empty."
  }
}

variable "floating_ip_type" {
  description = "Type of floating IP."
  type        = string
  default     = "ipv4"

  validation {
    condition     = contains(["ipv4", "ipv6"], lower(var.floating_ip_type))
    error_message = "The 'floating_ip_type' must be one of: ipv4, ipv6."
  }
}

variable "home_location" {
  description = "Home location for floating IP."
  type        = string
  default     = "fsn1"

  validation {
    condition     = !var.create_floating_ip || length(trimspace(var.home_location)) > 0
    error_message = "When 'create_floating_ip' is true, 'home_location' must not be empty (e.g., fsn1)."
  }
}

variable "floating_ip_server_id" {
  description = "Server ID to assign floating IP to."
  type        = number
  default     = null

  validation {
    condition     = var.floating_ip_server_id == null || var.floating_ip_server_id > 0
    error_message = "If set, 'floating_ip_server_id' must be a positive number."
  }
}
