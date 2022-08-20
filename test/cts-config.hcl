## Global Config
log_level = "DEBUG"
port      = 8558

syslog {
  enabled = false
}

buffer_period {
  enabled = true
  min = "5s"
  max = "20s"
}

# Vault Config Options (Optional)
vault {}


# Consul Block
consul {
  address = "localhost:8500"
}

# Driver "terraform" block
driver "terraform" {
  log         = true
  persist_log = false
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

# Task Block
task {
  name        = "zpa-app-segment-task"
  description = "Create/delete/update Application Segments"
  module      = "../"
  providers = ["zpa"]

  condition "services" {
    names = ["web", "api"]
  }
  variable_files = ["./consul-terraform-sync/config/terraform.tfvars"]
}
