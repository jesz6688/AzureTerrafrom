terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
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
