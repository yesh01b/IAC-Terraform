data "azurerm_client_config" "current" {
  # This resource is used to get the current Azure client configuration  
}

## Key Vault
resource "azurerm_key_vault" "keyvault" {
  name                = "kv-${var.environment}-${var.loc}-${var.instance}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Purge",
      "Recover",
      "Update",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge",
      "Recover",
    ]
  }
}

## Random Password for Key Vault
resource "random_password" "keyvault_password" {
  length           = 16
  special          = true
  override_special = "!@#$%^&*()-_=+[]{}|;:,.<>?/~`" # Customize as needed
  count            = 1
}

## Key Vault Secret
resource "azurerm_key_vault_secret" "keyvault_secret" {
  name            = "vm-sc-${var.environment}-${var.loc}-${var.instance}"
  value           = random_password.keyvault_password[0].result
  key_vault_id    = azurerm_key_vault.keyvault.id
  content_type    = var.content_type
  expiration_date = var.expiration_date # Set an appropriate expiration date

  tags = {
    environment = var.environment
    loc         = var.loc
    instance    = var.instance
  }
}