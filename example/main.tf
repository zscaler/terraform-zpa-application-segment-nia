terraform {
  required_providers {
    zpa = {
      source  = "zscaler/zpa"
      version = "~> 2.2.2"
    }
  }
}

terraform_provider "zpa" {
  zpa_client_id = "zpa_client_id"
  zpa_client_secret = "zpa_client_secret"
  zpa_customer_id = "zpa_customer_id"
}

module "application_segment_module" {
  source   = "../"
  services = var.services
}
