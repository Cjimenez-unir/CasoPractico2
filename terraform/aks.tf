# Clúster Azure Kubernetes Service (AKS)
# Clúster de Kubernetes gestionado por Azure.
# Sobre él se desplegará la aplicación con almacenamiento persistente (redis + frontend).

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name       # "aks-cjmenez-cp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix     # "aks-cjmenez-cp2"

  # Pool de nodos por defecto: 1 nodo Standard_B2s
  # (mínimo recomendado para cuentas de estudiante)
  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_size
  }

  # SystemAssigned: Azure crea y gestiona automáticamente la identidad del clúster
  # Necesaria para asignar el rol AcrPull sin service principals
  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "casopractico2"
  }
}

# Permiso AcrPull: AKS → ACR
# Asigna el rol "AcrPull" a la identidad del clúster AKS sobre el ACR.
# Permite que los nodos de AKS descarguen imágenes del ACR sin credenciales manuales.

resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}
