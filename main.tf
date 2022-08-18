terraform {
  required_providers {
    zpa = {
      source = "zscaler/zpa"
      version = "2.3.0"
    }
  }
}

resource "zpa_application_segment" "application_segment" {
  for_each         = local.consul_services

  name             = replace("${var.appsegment_prefix}${each.key}", "/[^0-9A-Za-z]/", "-")
  description      = "Service for ${var.cts_prefix}${each.key} created by Consul-Terraform-Sync"
  enabled          = true
  is_cname_enabled = true
  health_reporting = var.health_reporting
  bypass_type      = var.bypass_type
  icmp_access_type = var.icmp_access_type
  domain_names     = [for s in each.value : s.address]
  segment_group_id = zpa_segment_group.this.id
  tcp_port_ranges  = [for s in each.value : s.port]

  # UDP Port is optional - Add if needed
  # udp_port_ranges  = [for s in each.value : s.port]
  # dynamic "tcp_port_range" {
  #   for_each = local.tcp_port_range
  #   content {
  #     from = tcp_port_range.value
  #     to = tcp_port_range.value
  #   }
  # }
  server_groups {
    id = [zpa_server_group.this.id]
  }
  lifecycle {
    create_before_destroy = true
  }
depends_on = [zpa_segment_group.this, zpa_server_group.this, zpa_app_connector_group.this]
}

# Segment Group is required as part of the Application Segment Resource
resource "zpa_segment_group" "this" {
  name                   = "${var.cts_prefix}${var.segment_group_name}"
  description            = "${var.cts_prefix}${var.segment_group_description}"
  enabled                = var.segment_group_enabled
  tcp_keep_alive_enabled = var.tcp_keep_alive_enabled
}

# Server Group is required as part of the Application Segment Resource
resource "zpa_server_group" "this" {
  name                   = "${var.cts_prefix}${var.server_group_name}"
  description            = "${var.cts_prefix}${var.server_group_description}"
  enabled                = var.server_group_enabled
  dynamic_discovery      = var.server_group_dynamic_discovery
  app_connector_groups {
    id = [zpa_app_connector_group.this.id]
  }
}

# App Connector Group is required as part of the Server Group Resource
resource "zpa_app_connector_group" "this" {
  name                     = "${var.cts_prefix}AppConnector"
  description              = "${var.cts_prefix}AppConnector"
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