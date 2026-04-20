variable "create" {
  description = "Whether to create the floating IP."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the floating IP."
  type        = string
}

variable "type" {
  description = "Type of the IP (ipv4 or ipv6)."
  type        = string
  default     = "ipv4"
}

variable "home_location" {
  description = "Home location for the IP."
  type        = string
  default     = "fsn1"
}

variable "server_id" {
  description = "Server ID to assign to."
  type        = number
  default     = null
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
}
