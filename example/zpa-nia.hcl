
# Global Config Options
log_level = "INFO"
port = 8558
working_dir = "sync-tasks"

buffer_period {
  enabled = true
  min = "5s"
  max = "20s"
}

# Consul Config Options
consul {
  address = "consul-server-address:8500"
}

# Terraform Driver Options
driver "terraform" {
  log = true
  required_providers {
    zpa = {
      source = "zscaler/zpa"
      version = "~> 2.2.2"
    }
  }
}

# Zscaler Private Access Workflow Options
terraform_provider "zpa" {
  zpa_client_id = "zpa_client_id"
  zpa_client_secret = "zpa_client_secret"
  zpa_customer_id = "zpa_customer_id"
}

task {
  name = "zpa_application_segment_update"
  description = "Application Segment based on service definition"
  module = "/terraform-zpa-consul-sync-nia"
  providers = ["zpa"]

  condition "services" {
    names = ["nginx", "web", "api"]
  }
  variable_files = "terraform-zpa-consul-sync-nia/example/terraform.tfvars"
}