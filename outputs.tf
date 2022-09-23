output "consul_services" {
  description = "Application Segment Consul Locals"
  value       = local.consul_services
}

output "zpa_application_segment" {
  description = "The ZPA Application Segment"
  value       = zpa_application_segment.this
}

output "zpa_segment_group" {
  description = "The ZPA Segment Group"
  value       = zpa_segment_group.this
}

output "zpa_server_group" {
  description = "The ZPA Server Group"
  value       = zpa_server_group.this
}

output "zpa_app_connector_group" {
  description = "The ZPA App Connector Group"
  value       = zpa_app_connector_group.this
}
