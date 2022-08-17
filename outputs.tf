output "domain_names" {
  value = keys(local.consul_services)
}
