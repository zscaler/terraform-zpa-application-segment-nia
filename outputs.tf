# output "domain_names" {
#   value = keys(local.consul_services)
# }

output "application_segment_output" {
  value = local.consul_services
}