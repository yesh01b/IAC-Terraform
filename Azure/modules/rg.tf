## Resource Group

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment}-${var.loc}-${var.instance}"
  location = var.location

  tags = var.tags
}