output "zpa_application_segment" {
  description = "The ZPA Application Segment"
  value       = module.zpa_application_segment_module.zpa_application_segment
}

output "zpa_segment_group" {
  description = "The ZPA Segment Group"
  value       = module.zpa_application_segment_module.zpa_segment_group
}

output "zpa_server_group" {
  description = "The ZPA Server Group"
  value       = module.zpa_application_segment_module.zpa_server_group
}

output "zpa_app_connector_group" {
  description = "The ZPA App Connector Group"
  value       = module.zpa_application_segment_module.zpa_app_connector_group
}
