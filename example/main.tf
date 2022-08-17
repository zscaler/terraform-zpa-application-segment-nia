terraform {
  required_providers {
    zpa = {
      source  = "zscaler/zpa"
      version = "~> 2.2.2"
    }
  }
}

provider "zpa" {
  zpa_client_id = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_id }}{{ end }}"
  zpa_client_secret = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_secret }}{{ end }}"
  zpa_customer_id = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.customer_id }}{{ end }}"
}
# terraform_provider "zpa" {
#   zpa_client_id = "zpa_client_id"
#   zpa_client_secret = "zpa_client_secret"
#   zpa_customer_id = "zpa_customer_id"
# }

module "application_segment_module" {
  source   = "../"
  services = var.services
}
