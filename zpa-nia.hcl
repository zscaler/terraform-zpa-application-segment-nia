
# Global Config Options
log_level = "INFO"
port = 8558
working_dir = "sync-tasks"

buffer_period {
  enabled = true
  min = "5s"
  max = "20s"
}

# Vault Config Options
vault {}

# Consul Config Options
consul {
  address = "10.0.31.151:8500"
}

# # Consul Config Options
# consul {
#   address = "consul-server-address:8500"
# }

# Terraform Driver Options
driver "terraform" {
  log = true
  required_providers {
    zpa = {
      source = "zscaler/zpa"
      version = "2.3.0"
    }
  }
}

terraform_provider "zpa" {
  zpa_client_id = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_id }}{{ end }}"
  zpa_client_secret = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_secret }}{{ end }}"
  zpa_customer_id = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.customer_id }}{{ end }}"
}

task {
  name = "zpa_application_segment_update"
  description = "Application Segment based on service definition"
  module = "./"
  providers = ["zpa"]

  condition "services" {
    names = ["nginx","web","api"]
    # regexp = ".*"
  }
}

# Zscaler Private Access Workflow Options
# terraform_provider "zpa" {
#   zpa_client_id = "zpa_client_id"
#   zpa_client_secret = "zpa_client_secret"
#   zpa_customer_id = "zpa_customer_id"
# }

# task {
#   name = "zpa_application_segment_update"
#   description = "Application Segment based on service definition"
#   module = "/terraform-zpa-consul-sync-nia"
#   providers = ["zpa"]

#   condition "services" {
#     names = ["nginx", "web", "api"]
#   }
#   variable_files = "terraform-zpa-consul-sync-nia/example/terraform.tfvars"
# }