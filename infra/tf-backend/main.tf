# terraform {
#   backend "azurerm" {
#     resource_group_name   = "abhi0012-githubactions-rg"
#     storage_account_name  = "abhi0012githubactions"
#     container_name        = "tfstate"
#     key                   = "terraform.tfstate"
#   }
# }

provider "azurerm" {
  features {}
  subscription_id = "454cef6e-c0dd-444f-9766-2fcc4e902f67"
}

resource "azurerm_resource_group" "tf_backend" {
  name     = "abhi0012-githubactions-rg"
  location = "East US"
}

resource "azurerm_storage_account" "tf_backend" {
  name                     = "abhi0012githubactions"
  resource_group_name      = azurerm_resource_group.tf_backend.name
  location                 = azurerm_resource_group.tf_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_backend.name
  container_access_type = "private"
}

output "resource_group_name" {
  value = azurerm_resource_group.tf_backend.name
}

output "storage_account_name" {
  value = azurerm_storage_account.tf_backend.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate.name
}

output "arm_access_key" {
  value     = azurerm_storage_account.tf_backend.primary_access_key
  sensitive = true
}
