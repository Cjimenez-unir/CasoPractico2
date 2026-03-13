terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

# Configuración del provider de Azure
# Usa las credenciales del az login (Azure CLI)
provider "azurerm" {
  features {}
}

# Grupo de recursos principal
# Todos los recursos del caso práctico se crean dentro de este resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "casopractico2"
  }
}
