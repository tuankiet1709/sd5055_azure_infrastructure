# Azure Container Registry - stores Docker images (like AWS ECR)
resource "azurerm_container_registry" "main" {
  name                = var.registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku # Basic, Standard, or Premium
  admin_enabled       = true    # Enable admin user for simple access

  tags = var.tags
}