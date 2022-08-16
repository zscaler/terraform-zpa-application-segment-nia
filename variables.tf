variable "services" {
  description = "Consul services monitored by Consul NIA"
  type = map(
    object({
      id        = string
      name      = string
      address   = string
      port      = number
      status    = string
      meta      = map(string)
      tags      = list(string)
      namespace = string

      node                  = string
      node_id               = string
      node_address          = string
      node_datacenter       = string
      node_tagged_addresses = map(string)
      node_meta             = map(string)
      cts_user_defined_meta = map(string)
    })
  )
}

variable "appsegment_prefix" {
  type        = string
  description = "(Optional) Prefix added to the dynamic application segment created by Consul"
  default     = ""
}

variable "appsegment_suffix" {
  type        = string
  description = "(Optional) Suffix added to the dynamic application segment created by Consul"
  default     = ""
}

variable "cts_prefix" {
  type        = string
  description = "(Optional) Prefix that will be applied to all objects created via Consul-Terraform-Sync"
  default     = "cts-"
}


variable "health_reporting" {
  type        = string
  description = "Health reporting for the application segment created by Consul-Terraform-Sync. "
  validation {
    condition     = var.health_reporting != "NONE" || var.health_reporting != "ON_ACCESS" || var.health_reporting != "CONTINUOUS"
    error_message = "The variable health_reporting must be \"NONE\", \"ON_ACCESS\", or \"CONTINUOUS\"."
  }
  default = "ON_ACCESS"
}

variable "icmp_access_type" {
  type        = string
  description = "ICMP Access Type for the application segment created by Consul-Terraform-Sync. "
  validation {
    condition     = var.icmp_access_type != "NONE" || var.icmp_access_type != "PING" || var.icmp_access_type != "PING_TRACEROUTING"
    error_message = "The variable icmp_access_type must be \"NONE\", \"PING\", or \"PING_TRACEROUTING\"."
  }
  default = "NONE"
}

variable "bypass_type" {
  type        = string
  description = "Bypass Type for the application segment created by Consul-Terraform-Sync. "
  validation {
    condition     = var.bypass_type != "NEVER" || var.bypass_type != "ALWAYS" || var.bypass_type != "ON_NET"
    error_message = "The variable bypass_type must be \"NEVER\", \"ALWAYS\", or \"ON_NET\"."
  }
  default = "NEVER"
}