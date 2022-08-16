terraform {
  required_providers {
    zpa = {
      source  = "zscaler/zpa"
      version = "~> 2.2.2"
    }
  }
}

resource "zpa_application_segment" "application_segment" {
  for_each         = local.consul_services

  name             = replace("${var.appsegment_prefix}${each.key}${var.appsegment_suffix}", "/[^0-9A-Za-z]/", "-")
  description      = "Service for ${var.cts_prefix}${each.key} created by Consul-Terraform-Sync"
  enabled          = true
  is_cname_enabled = true
  health_reporting = var.health_reporting
  bypass_type      = var.bypass_type
  icmp_access_type = var.icmp_access_type
  domain_names     = [for s in each.value : s.address]
  segment_group_id = zpa_segment_group.this.id
  server_groups {
    id = [zpa_server_group.this.id]
  }
  tcp_port_ranges  = ["80", "80"]
  lifecycle {
    create_before_destroy = true
  }
}

locals {
  consul_services = {
    for id, s in var.services : s.name => s...
  }

}

resource "zpa_segment_group" "this" {
  name                   = "Consul_TF_Sync"
  description            = "Consul_TF_Sync"
  enabled                = true
  tcp_keep_alive_enabled = "1"
}

resource "zpa_server_group" "this" {
  name              = "Consul_TF_Sync"
  description       = "Consul_TF_Sync"
  enabled           = true
  dynamic_discovery = true
  app_connector_groups {
    id = [zpa_app_connector_group.this.id]
  }
}

resource "zpa_app_connector_group" "this" {
  name                     = "Consul_TF_Sync"
  description              = "Consul_TF_Sync"
  enabled                  = true
  country_code             = "US"
  latitude                 = "37.3382082"
  longitude                = "-121.8863286"
  location                 = "San Jose, CA, USA"
  upgrade_day              = "SUNDAY"
  upgrade_time_in_secs     = "66600"
  override_version_profile = true
  version_profile_id       = 2
  dns_query_type           = "IPV4_IPV6"
}