################################################################################
# ZPA Application Segment
################################################################################
# Create a Application Segment
# https://help.zscaler.com/zpa/application-segment-use-cases

resource "zpa_application_segment" "this" {
  for_each = local.consul_services

  name             = replace("${var.appsegment_prefix}${each.key}", "/[^0-9A-Za-z]/", "-")
  description      = "Service for ${var.cts_prefix}${each.key} created by Consul-Terraform-Sync"
  enabled          = true
  is_cname_enabled = true
  health_reporting = var.health_reporting
  bypass_type      = var.bypass_type
  icmp_access_type = var.icmp_access_type
  domain_names     = [for s in each.value : s.address]
  segment_group_id = data.zpa_segment_group.this.id
  tcp_port_ranges  = [for s in each.value : s.port]
  # UDP Port is optional - Add if needed
  # udp_port_ranges  = [for s in each.value : s.port]
  server_groups {
    id = [data.zpa_server_group.this.id]
  }
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [data.zpa_segment_group.this, data.zpa_server_group.this, data.zpa_app_connector_group.this]
}

################################################################################
# ZPA Segment Group
################################################################################
# Create a Segment Group
# https://help.zscaler.com/zpa/application-segment-group-use-cases
resource "zpa_segment_group" "this" {
  count = var.byo_segment_group == true ? 1 : 0

  name                   = "${var.cts_prefix}${var.segment_group_name}"
  description            = "${var.cts_prefix}${var.segment_group_description}"
  enabled                = var.segment_group_enabled
  tcp_keep_alive_enabled = var.tcp_keep_alive_enabled
}

# Or reference an existing Segment Group
data "zpa_segment_group" "this" {
  id = var.byo_segment_group == true ? zpa_segment_group.this.*.id[0] : var.byo_segment_group_id
  #name = var.byo_segment_group == true ? zpa_segment_group.this.*.name[0] : var.byo_segment_group_id
}

################################################################################
# ZPA Server Group
################################################################################
# Create a Server Group
# https://help.zscaler.com/zpa/application-server-group-use-cases
resource "zpa_server_group" "this" {
  count = var.byo_server_group == true ? 1 : 0

  name              = "${var.cts_prefix}${var.server_group_name}"
  description       = "${var.cts_prefix}${var.server_group_description}"
  enabled           = var.server_group_enabled
  dynamic_discovery = var.server_group_dynamic_discovery
  app_connector_groups {
    id = [data.zpa_app_connector_group.this.id]
  }
}

# Or reference an existing Server Group
data "zpa_server_group" "this" {
  id = var.byo_server_group == true ? zpa_server_group.this.*.id[0] : var.byo_server_group_id
  #name = var.byo_server_group == true ? zpa_server_group.this.*.name[0] : var.byo_server_group_id
}

################################################################################
# ZPA App Connector Group
################################################################################
# Create an App Connector Group
# https://help.zscaler.com/zpa/app-connector-group-use-cases
resource "zpa_app_connector_group" "this" {
  count = var.byo_app_connector_group == true ? 1 : 0

  name                     = "${var.cts_prefix}${var.app_connector_group_name}"
  description              = "${var.cts_prefix}${var.app_connector_group_description}"
  enabled                  = var.app_connector_group_enabled
  city_country             = var.app_connector_group_city_country
  country_code             = var.app_connector_group_country_code
  latitude                 = var.app_connector_group_latitude
  longitude                = var.app_connector_group_longitude
  location                 = var.app_connector_group_location
  upgrade_day              = var.app_connector_group_upgrade_day
  upgrade_time_in_secs     = var.app_connector_group_upgrade_time_in_secs
  override_version_profile = var.app_connector_group_override_version_profile
  version_profile_id       = var.app_connector_group_version_profile_id
  dns_query_type           = var.app_connector_group_dns_query_type
}

# Or reference an existing App Connector Group
data "zpa_app_connector_group" "this" {
  id = var.byo_app_connector_group == true ? zpa_app_connector_group.this.*.id[0] : var.byo_app_connector_group_id
  #name = var.byo_app_connector_group == true ? zpa_app_connector_group.this.*.name[0] : var.byo_app_connector_group_id
}
