resource "azurerm_virtual_machine" "vm1" {
  name                  = var.vm_name 
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.nic1.id]
  vm_size               = "Standard DS3 v2"
  storage_os_disk {
    name = "syeddisk1"
    caching = "ReadWrite"
    managed_disk_type = "Standard_LRS"
    create_option = "FromImage"
  }
  delete_os_disk_on_termination = true
  
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  os_profile {
    computer_name  = "trainingsystem"
    admin_username = "azureuser"
    admin_password = "Accenture@123"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    "environment" = "dev"
    "tier"        = "frontend"
  }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.azurerm_virtual_network
  address_space       = ["10.0.0.0/16"]
  location              = var.location
  resource_group_name   = var.resource_group_name
}


resource "azurerm_subnet" "subnet1" {
  name                 = var.azurerm_subnet
  resource_group_name   = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic1" {
  name                = var.azurerm_network_interface
  location              = var.location
  resource_group_name   = var.resource_group_name

  ip_configuration {
    name                          = "config111"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id =azurerm_public_ip.public1.id
  }
}

resource "azurerm_public_ip" "public1" {
  name = var.azurerm_public_ip
  resource_group_name   = var.resource_group_name
  location              = var.location
  allocation_method = "Static" 

  tags = {
    "environment" = "dev"
  }
}
