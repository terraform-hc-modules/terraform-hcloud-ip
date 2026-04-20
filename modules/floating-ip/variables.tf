variable "create" {
  description = "Whether to create the floating IP."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the floating IP."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The 'name' must not be empty."
  }
}

variable "type" {
  description = "Type of the IP (ipv4 or ipv6)."
  type        = string
  default     = "ipv4"

  validation {
    condition     = contains(["ipv4", "ipv6"], lower(var.type))
    error_message = "The 'type' must be one of: ipv4, ipv6."
  }
}

variable "home_location" {
  description = "Home location for the IP."
  type        = string
  default     = "fsn1"

  validation {
    condition     = length(trimspace(var.home_location)) > 0
    error_message = "The 'home_location' must not be empty (e.g., fsn1)."
  }
}

variable "server_id" {
  description = "Server ID to assign to."
  type        = number
  default     = null

  validation {
    condition     = var.server_id == null || var.server_id > 0
    error_message = "If set, 'server_id' must be a positive number."
  }
}

variable "delete_protection" {
  description = "Enable delete protection."
  type        = bool
  default     = false
}

variable "labels" {
  description = "Labels to apply."
  type        = map(string)
  default     = {}
}

variable "description" {
  description = "Description of the floating IP."
  type        = string
  default     = null

  validation {
    condition     = var.description == null || length(trimspace(var.description)) > 0
    error_message = "If set, 'description' must not be empty."
  }
}
