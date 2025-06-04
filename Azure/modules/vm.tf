## Network Interface

resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.environment}-${var.loc}-${var.instance}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

## Virtual Machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm${var.environment}${var.loc}${var.instance}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = azurerm_key_vault_secret.keyvault_secret.value # Use a secure password or SSH key in production
  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  tags = var.tags
}