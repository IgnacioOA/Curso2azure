terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.70.0"
    }
  }
}

#creo el proveedor de Azure y le pongo mi suscripción_id.Debería de venir en un secreto de Azure Key Vault
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

#Creamos un grupo de recursos para englobar todos los recursos de este ejercicio bajo el tab casopractico2
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "casopractico2"
  }
}

# Creamos una cuenta de almacenamiento para almacenar los datos de la VM y otros recursos
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "casopractico2"
  }
}

#Creamos un Azure Container Registry (ACR) para almacenar imágenes de contenedores que me he bajado anteriormente
resource "azurerm_container_registry" "acr" {
  name                = var.acr
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}
