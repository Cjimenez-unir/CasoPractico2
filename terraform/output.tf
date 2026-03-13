# Outputs de Terraform para CP2
# Valores generados durante el apply que necesitarás para la parte de Ansible.
# Los marcados sensitive=true no se muestran en pantalla.
# Para verlos: terraform output -raw <nombre_variable>

# IP pública de la VM → va al inventario de Ansible (fichero hosts)
output "vm_public_ip" {
  description = "IP pública de la VM (añádela al inventario de Ansible)"
  value       = azurerm_public_ip.public_ip.ip_address
}

# Clave SSH privada → necesaria para que Ansible se conecte a la VM por SSH
# Guárdala con:
#   terraform output -raw ssh_private_key > private_key.pem
#   chmod 600 private_key.pem
output "ssh_private_key" {
  description = "Clave SSH privada para acceder a la VM (sensible)"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

# URL del ACR → se usa en los playbooks de Ansible para hacer login y push/pull
output "acr_login_server" {
  description = "URL de login del ACR (formato: acrcjmenezcp2.azurecr.io)"
  value       = azurerm_container_registry.acr.login_server
}

# Usuario admin del ACR → se usa en el rol acr de Ansible
output "acr_admin_username" {
  description = "Usuario administrador del ACR"
  value       = azurerm_container_registry.acr.admin_username
}

# Contraseña admin del ACR → se usa en el rol acr de Ansible (guárdala en secrets.yml)
# Consultar con: terraform output -raw acr_admin_password
output "acr_admin_password" {
  description = "Contraseña del administrador del ACR (sensible)"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}

# Nombre del ACR → se usa en la variable acr_name del inventario de Ansible
output "acr_name" {
  description = "Nombre del Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

# Kubeconfig del clúster AKS → necesario para que kubectl y Ansible se conecten al clúster
# Guárdalo con:
#   terraform output -raw kube_config > ~/.kube/config
output "kube_config" {
  description = "Fichero kubeconfig para conectarse al clúster AKS (sensible)"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

# Nombre del resource group → útil para comandos az cli posteriores
output "resource_group_name" {
  description = "Nombre del resource group creado"
  value       = azurerm_resource_group.rg.name
}
