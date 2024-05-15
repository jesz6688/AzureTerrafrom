resource "azurerm_virtual_machine" "vm1" {
  name                  = "tryterraformvm1"
  resource_group_name   = "1-fb4b4b74-playground-sandbox"
  location              = "West US"
  network_interface_ids = [azurerm_network_interface.nic1.id]
  vm_size               = "Standard_D2s_v3"
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
  name                = "tryterraformvnet1"
  address_space       = ["10.0.0.0/16"]
  location            = "West US"
  resource_group_name = "1-fb4b4b74-playground-sandbox"
}


resource "azurerm_subnet" "subnet1" {
  name                 = "tryterraformsubnet1"
  resource_group_name  = "1-fb4b4b74-playground-sandbox"
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic1" {
  name                = "tryterraformnic1"
  location            = "West US"
  resource_group_name = "1-fb4b4b74-playground-sandbox"

  ip_configuration {
    name                          = "config121"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id =azurerm_public_ip.public1.id
  }
}

resource "azurerm_public_ip" "public1" {
  name = "tryterraformpubip1"
  resource_group_name = "1-fb4b4b74-playground-sandbox"
  location = "West US"
  allocation_method = "Static"

  tags = {
    "environment" = "dev"
  }
}
