terraform {
  required_providers {
    zpa = {
      source  = "zscaler/zpa"
      version = ">=2.3.2"
    }
  }
  required_version = ">= 0.13"
}

/*
################################################################################
# Required when using HashiCorp Vault to Store ZPA API Keys
################################################################################
provider "zpa" {
  zpa_client_id     = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_id }}{{ end }}"
  zpa_client_secret = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.client_secret }}{{ end }}"
  zpa_customer_id   = "{{ with secret \"zscaler/zpacloud\" }}{{ .Data.data.customer_id }}{{ end }}"
}
*/

provider "zpa" {
  # zpa_client_id     = "xxxxxxxxx"
  # zpa_client_secret = "xxxxxxxxx"
  # zpa_customer_id   = "123456789"
}


module "zpa_application_segment_module" {
  source = "../"
  services = var.services

  # Bring-Your-Own Variables
  byo_segment_group            = var.byo_segment_group
  byo_segment_group_name       = var.byo_segment_group_name
  byo_segment_group_id         = var.byo_segment_group_id
  byo_server_group             = var.byo_server_group
  byo_server_group_name        = var.byo_server_group_name
  byo_server_group_id          = var.byo_server_group_id
  byo_app_connector_group      = var.byo_app_connector_group
  byo_app_connector_group_name = var.byo_app_connector_group_name
  byo_app_connector_group_id   = var.byo_app_connector_group_id
}
