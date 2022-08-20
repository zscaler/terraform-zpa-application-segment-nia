output "tcp_port_ranges" {
  description = "Map of public IPs created within the module."
  value       = { for k, v in module.zpa_application_segment_module : k => v.tcp_port_ranges }
}
