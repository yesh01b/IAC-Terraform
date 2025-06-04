## provider varaiables

variable "subscription_id" {
  description = "The Azure subscription ID to use for the resources."
  type        = string
}
## Common variables
variable "environment" {
  description = "The environment for the resources (e.g., dev, test, prod)."
  type        = string
  default     = "dev"
}
variable "instance" {
  description = "An instance identifier for the resources, useful for naming."
  type        = string
  default     = "01"
}
variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  default     = "uksouth"
}
variable "loc" {
  description = "The environment for the resources (e.g., dev, test, prod)."
  type        = string
  default     = "uks"
}
variable "tags" {
  description = "A map of tags to assign to the resource group."
  type        = map(string)
  default     = {}
}

## Key Vault variables
variable "content_type" {
  description = "The content type for the Key Vault secret."
  type        = string
  default     = "vmadminuser"

}
variable "expiration_date" {
  description = "The expiration date for the Key Vault secret."
  type        = string
  default     = "2025-12-31T23:59:59Z" # Adjust as needed
}

## Virtual Network variables
variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

## Subnet variables

variable "address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}

# ## Virtual Machine variables

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_B1s" ## or "Standard_DS1_v2" # Adjust as needed
}
variable "vm_username" {
  description = "The username for the virtual machine."
  type        = string
  default     = "vmadminuser" ## Adjust as needed
}