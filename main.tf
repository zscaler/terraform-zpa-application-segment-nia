resource "zpa_application_segment" "application_segment" {
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
  depends_on = [zpa_segment_group.this, zpa_server_group.this, zpa_app_connector_group.this]
}

################################################################################
# ZPA Segment Group
################################################################################
# Create a Segment Group
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

# Change both conditions in the resource and data source to dalse and the segment group creation fails (can't find ID and Name)
# Change both conditions in the resource and data source to true and the segment group is created
# Change conditions in the resource to false and true in the data source
# Change condition in the resource to true and false in the data source


################################################################################
# ZPA Server Group
################################################################################
# Create a Server Group
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
resource "zpa_app_connector_group" "this" {
  count = var.byo_app_connector_group == true ? 1 : 0

  name                          = "${var.cts_prefix}${var.app_connector_group_name}"
  description                   = "${var.cts_prefix}${var.app_connector_group_description}"
  enabled                       = true
  city_country                  = "California, US"
  country_code                  = "US"
  latitude                      = "37.3382082"
  longitude                     = "-121.8863286"
  location                      = "San Jose, CA, USA"
  upgrade_day                   = "SUNDAY"
  upgrade_time_in_secs          = "66600"
  override_version_profile      = true
  version_profile_id            = 0
  dns_query_type                = "IPV4_IPV6"
}

# Or reference an existing App Connector Group
data "zpa_app_connector_group" "this" {
  id = var.byo_app_connector_group == true ? zpa_app_connector_group.this.*.id[0] : var.byo_app_connector_group_id
  #name = var.byo_app_connector_group == true ? zpa_app_connector_group.this.*.name[0] : var.byo_app_connector_group_id
}
