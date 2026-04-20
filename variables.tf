variable "name" {
  description = "Name prefix for resources."
  type        = string
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
}

variable "primary_ip_type" {
  description = "Type of primary IP."
  type        = string
  default     = "ipv4"
}

variable "datacenter" {
  description = "Datacenter for primary IP."
  type        = string
  default     = null
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
}

variable "floating_ip_type" {
  description = "Type of floating IP."
  type        = string
  default     = "ipv4"
}

variable "home_location" {
  description = "Home location for floating IP."
  type        = string
  default     = "fsn1"
}

variable "floating_ip_server_id" {
  description = "Server ID to assign floating IP to."
  type        = number
  default     = null
}
