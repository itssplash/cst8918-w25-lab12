


terraform {
  backend "azurerm" {
    resource_group_name  = "abhi0012-githubactions-rg"
    storage_account_name = "abhi0012githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  subscription_id = "454cef6e-c0dd-444f-9766-2fcc4e902f67"
  tenant_id = "e39de75c-b796-4bdd-888d-f3d21250910c"
  use_oidc        = true
}

resource "azurerm_resource_group" "app_rg" {
  name     = "abhi0012-a12-rg"
  location = "East US"
}

output "resource_group_name" {
  value = azurerm_resource_group.app_rg.name
  description = "The name of the Azure resource group."
}
