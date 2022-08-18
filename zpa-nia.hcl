
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
  module = "github.com/zscaler/terraform-zpa-application-segment-nia"
  providers = ["zpa"]

  condition "services" {
    names = ["nginx","web","api"]
  }
}
