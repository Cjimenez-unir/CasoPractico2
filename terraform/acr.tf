# Azure Container Registry (ACR)
# Repositorio privado de imágenes de contenedores.
# Se usará para:
#   - Almacenar la imagen del servidor web nginx (desplegada en la VM con Podman)
#   - Almacenar la imagen de la aplicación con persistencia (desplegada en AKS)

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name      # "acrcjmenezcp2" — único a nivel global
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # SKU Basic: suficiente para el ejercicio y el más económico
  sku = "Basic"

  # admin_enabled = true permite autenticarse con usuario/contraseña sencilla
  # En producción se usarían Managed Identities o service principals
  admin_enabled = true

  tags = {
    environment = "casopractico2"
  }
}
