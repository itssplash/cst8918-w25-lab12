


terraform {
    

  backend "azurerm" {
    resource_group_name  = "abhi0012-githubactions-rg"
    storage_account_name = "abhi0012githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
    access_key           = "clHg+NlOqRxk+mrMhhqLJ5pLnVzG3/x8IWLinzue1cAHvI8kgjkgSWzSXp6EKzmfoN0XeCAnsbYG+AStY5Iu0g==" # Reference ARM access key dynamically
  }
}

provider "azurerm" {
  features {}
  subscription_id = "454cef6e-c0dd-444f-9766-2fcc4e902f67"
  use_oidc = true 
}

resource "azurerm_resource_group" "app_rg" {
  name     = "abhi0012-a12-rg"
  location = "East US"
}

output "resource_group_name" {
  value = azurerm_resource_group.app_rg.name
}
