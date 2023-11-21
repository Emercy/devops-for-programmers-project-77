terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1 "
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}


# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}
