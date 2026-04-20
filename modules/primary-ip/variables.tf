variable "create" {
  description = "Whether to create the primary IP."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the primary IP."
  type        = string
}

variable "type" {
  description = "Type of the IP (ipv4 or ipv6)."
  type        = string
  default     = "ipv4"
}

variable "assignee_type" {
  description = "Type of the assignee (server)."
  type        = string
  default     = "server"
}

variable "assignee_id" {
  description = "ID of the assignee."
  type        = number
  default     = null
}

variable "datacenter" {
  description = "Datacenter for the IP."
  type        = string
  default     = null
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
