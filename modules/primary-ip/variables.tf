variable "create" {
  description = "Whether to create the primary IP."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the primary IP."
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

variable "assignee_type" {
  description = "Type of the assignee (server)."
  type        = string
  default     = "server"

  validation {
    condition     = var.assignee_type == "server"
    error_message = "The 'assignee_type' must be 'server'."
  }
}

variable "assignee_id" {
  description = "ID of the assignee."
  type        = number
  default     = null

  validation {
    condition     = var.assignee_id == null || var.assignee_id > 0
    error_message = "If set, 'assignee_id' must be a positive number."
  }
}

variable "datacenter" {
  description = "Datacenter for the IP."
  type        = string
  default     = null

  validation {
    condition     = var.datacenter == null || length(trimspace(var.datacenter)) > 0
    error_message = "If set, 'datacenter' must not be empty."
  }
}

variable "auto_delete" {
  description = "Auto delete when assignee is deleted."
  type        = bool
  default     = false
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
