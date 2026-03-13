# Variables generales
variable "location" {
  description = "Región de Azure donde se crearán los recursos"
  type        = string
  default     = "Spain Central"
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos que contendrá toda la infraestructura"
  type        = string
  default     = "rg-cjmenez-cp2"
}

# Variables de la máquina virtual
variable "vm_name" {
  description = "Nombre de la máquina virtual Linux"
  type        = string
  default     = "vm-cjmenez-cp2"
}

variable "vm_size" {
  description = "Tamaño/SKU de la máquina virtual"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "admin_username" {
  description = "Nombre del usuario administrador de la VM (usado para conectarse por SSH)"
  type        = string
  default     = "azureuser"
}

variable "vnet_name" {
  description = "Nombre de la red virtual donde estará la VM"
  type        = string
  default     = "vnet-cjmenez-cp2"
}

variable "subnet_name" {
  description = "Nombre de la subred dentro de la red virtual"
  type        = string
  default     = "subnet-cjmenez-cp2"
}

variable "nsg_name" {
  description = "Nombre del Network Security Group (reglas de firewall) de la VM"
  type        = string
  default     = "nsg-cjmenez-cp2"
}

variable "public_ip_name" {
  description = "Nombre de la IP pública asignada a la VM"
  type        = string
  default     = "pip-cjmenez-cp2"
}

variable "nic_name" {
  description = "Nombre de la interfaz de red de la VM"
  type        = string
  default     = "nic-cjmenez-cp2"
}

# Variables del Azure Container Registry
variable "acr_name" {
  description = "Nombre del ACR (único a nivel global, solo letras y números, sin guiones)"
  type        = string
  default     = "acrcjmenezcp2"
}

# Variables del clúster AKS
variable "aks_name" {
  description = "Nombre del clúster de Kubernetes (AKS)"
  type        = string
  default     = "aks-cjmenez-cp2"
}

variable "aks_node_count" {
  description = "Número de nodos worker del clúster AKS"
  type        = number
  default     = 1
}

variable "aks_node_size" {
  description = "Tamaño de las VMs que actúan como nodos del clúster AKS"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "dns_prefix" {
  description = "Prefijo DNS para el endpoint del clúster AKS"
  type        = string
  default     = "aks-cjmenez-cp2"
}
