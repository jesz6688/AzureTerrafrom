terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}

provider "azurerm" {
  # Configuration options chsnge
  /*
    Multi line comment
  */
  features {}
  skip_provider_registration = true
}
