


terraform {
    
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "abhi0012-githubactions-rg"
    storage_account_name = "abhi0012githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
    access_key           = secrets.ARM_ACCESS_KEY # Reference ARM access key dynamically
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
