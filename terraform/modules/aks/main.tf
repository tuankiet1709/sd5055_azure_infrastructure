# Azure Kubernetes Service - runs containerized applications
resource "azurerm_kubernetes_cluster" "main" {
  name                = "${var.project}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.project}-aks"

  # Default node pool
  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
    vnet_subnet_id = var.subnet_id
  }

  # Identity for AKS cluster
  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

# Attach ACR to AKS - allows AKS to pull images from ACR
resource "azurerm_role_assignment" "aks_acr" {
  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}