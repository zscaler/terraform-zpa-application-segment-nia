terraform {
  required_providers {
    zpa = {
      source  = "zscaler/zpa"
      version = ">=2.3.2"
    }
  }
  required_version = ">= 0.13"
}