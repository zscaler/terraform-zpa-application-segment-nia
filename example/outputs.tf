output "zpa_application_segment_domain_names" {
  description = "The ZPA Application Segment"
  value       = module.zpa_application_segment_module.zpa_application_segment_domain_names
}
output "zpa_application_segment_tcp_port_range" {
  description = "The ZPA Application Segment"
  value       = module.zpa_application_segment_module.zpa_application_segment_tcp_port_range
}

# output "zpa_segment_group" {
#   description = "The ZPA Segment Group"
#   value       = module.zpa_application_segment_module.zpa_segment_group
# }

# output "zpa_server_group" {
#   description = "The ZPA Server Group"
#   value       = module.zpa_application_segment_module.zpa_server_group
# }

# output "zpa_app_connector_group" {
#   description = "The ZPA App Connector Group"
#   value       = module.zpa_application_segment_module.zpa_app_connector_group
# }
