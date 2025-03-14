variable "resource_group_name" {
  type = string
  default = "1-7ff20d33-playground-sandbox"
}

variable "location" {
  type = string
  default = "westus"
}

variable "vm_name" {
  type = string
  default = "dockervmlinux"
}

variable "azurerm_public_ip" {
  type = string
  default = "dockertrypubip"
}

variable "azurerm_network_interface" {
  type = string
  default = "dockertrynic"
}

variable "azurerm_subnet" {
  type = string
  default = "dockertrysubnet"
}

variable "azurerm_virtual_network" {
  type = string
  default = "dockertryvnet"
}
