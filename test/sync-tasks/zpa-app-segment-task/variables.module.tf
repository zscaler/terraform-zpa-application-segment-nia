# This file is generated by Consul Terraform Sync.
#
# The HCL blocks, arguments, variables, and values are derived from the
# operator configuration for Sync. Any manual changes to this file
# may not be preserved and could be overwritten by a subsequent update.
#
# Task: zpa-app-segment-task
# Description: Create/delete/update Application Segments

variable "services" {
  default = null
  type = object({
    api = object({
      address         = string
      id              = string
      kind            = string
      meta            = object({})
      name            = string
      node            = string
      node_address    = string
      node_datacenter = string
      node_id         = string
      node_meta       = object({})
      node_tagged_addresses = object({
        lan = string
        wan = string
      })
      port   = number
      status = string
      tags   = tuple([])
    })
    web_1 = object({
      address         = string
      id              = string
      kind            = string
      meta            = object({})
      name            = string
      node            = string
      node_address    = string
      node_datacenter = string
      node_id         = string
      node_meta = object({
        somekey = string
      })
      node_tagged_addresses = object({
        lan = string
        wan = string
      })
      port   = number
      status = string
      tags   = tuple([string])
    })
    web_2 = object({
      address         = string
      id              = string
      kind            = string
      meta            = object({})
      name            = string
      node            = string
      node_address    = string
      node_datacenter = string
      node_id         = string
      node_meta       = object({})
      node_tagged_addresses = object({
        lan = string
        wan = string
      })
      port   = number
      status = string
      tags   = tuple([string])
    })
  })
}