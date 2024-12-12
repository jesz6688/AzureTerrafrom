variable "resource_group_name" {
  type = string
  default = "1-ba821f84-playground-sandbox"
}

variable "location" {
  type = string
  default = "southcentralus"
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
