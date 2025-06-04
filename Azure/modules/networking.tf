## Virtual networks

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}-${var.loc}-${var.instance}"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

## Subnets

resource "azurerm_subnet" "snet" {
  name                 = "snet-${var.environment}-${var.loc}-${var.instance}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
}