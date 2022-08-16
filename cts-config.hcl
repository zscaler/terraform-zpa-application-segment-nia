
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
  address = "35.183.112.47:8500"
}

# Terraform Driver Options
driver "terraform" {
  log = true
  persist_log = false
  backend "consul" {
    gzip = true
  }
  required_providers {
    zpa = {
      source = "zscaler/zpa"
    }
  }
}

# Zscaler Private Access Workflow Options
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
    names = ["nginx", "web", "api"]
  }
}