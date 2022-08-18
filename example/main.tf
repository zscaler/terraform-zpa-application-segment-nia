terraform {
  required_providers {
    zpa = {
      source  = "zscaler/zpa"
      version = "~> 2.3.0"
    }
  }
}

provider "zpa" {
  zpa_client_id     = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_id }}{{ end }}"
  zpa_client_secret = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_secret }}{{ end }}"
  zpa_customer_id   = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.customer_id }}{{ end }}"
}
# terraform_provider "zpa" {
#   zpa_client_id = "zpa_client_id"
#   zpa_client_secret = "zpa_client_secret"
#   zpa_customer_id = "zpa_customer_id"
# }

module "zpa-application-segment_module" {
  # source   = "github.com/zscaler/terraform-zpa-application-segment-nia"
  source   = "../"
  services = var.services

  # Bring-Your-Own Variables
  byo_segment_group       = var.byo_segment_group
  byo_segment_group_id    = var.byo_segment_group_id
  byo_server_group        = var.byo_server_group
  byo_server_group_id     = var.byo_server_group_id
  byo_app_connector_group = var.byo_app_connector_group
}
