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