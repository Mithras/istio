terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }

  backend "azurerm" {
    subscription_id      = "0302e263-20e2-44ea-9d57-91db52a566fe" # AG_CI_CE_BLK_CORE_ANITRA
    resource_group_name  = "terraform"
    storage_account_name = "ht0p26zo5o"
    container_name       = "tfstate"
    key                  = "istio.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
