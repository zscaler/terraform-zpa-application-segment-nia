output "consul_services" {
  description = "Application Segment Consul Locals"
  value       = local.consul_services
}

################################################################################
# Application Segment Outputs
################################################################################
output "zpa_application_segment_id" {
  description = "The ZPA Application Segment ID"
  value       = zpa_application_segment.this.id
}

output "zpa_application_segment_name" {
  description = "The ZPA Application Segment Name"
  value       = zpa_application_segment.this.name
}

output "zpa_application_segment_domain_names" {
  description = "The ZPA Application Segment Domain Name"
  value       = zpa_application_segment.this.domain_names
}

output "zpa_application_segment_tcp_port_range" {
  description = "The ZPA Application Segment Domain Name"
  value       = zpa_application_segment.this.tcp_port_range
}

output "zpa_application_segment_udp_port_range" {
  description = "The ZPA Application Segment Domain Name"
  value       = zpa_application_segment.this.udp_port_range
}

################################################################################
# Segment Group Outputs
################################################################################
output "zpa_segment_group_id" {
  description = "The ZPA Segment Group ID"
  value       = zpa_segment_group.this.id
}

output "zpa_segment_group_name" {
  description = "The ZPA Segment Group Name"
  value       = zpa_segment_group.this.name
}

################################################################################
# Server Group Outputs
################################################################################
output "zpa_server_group_id" {
  description = "The ZPA Server Group ID"
  value       = zpa_server_group.this.id
}

output "zpa_server_group_name" {
  description = "The ZPA Server Group Name"
  value       = zpa_server_group.this.name
}

################################################################################
# App Connector Group Outputs
################################################################################
output "zpa_app_connector_group_id" {
  description = "The ZPA App Connector Group ID"
  value       = zpa_app_connector_group.this.id
}

output "zpa_app_connector_group_name" {
  description = "The ZPA App Connector Group Name"
  value       = zpa_app_connector_group.this.name
}
