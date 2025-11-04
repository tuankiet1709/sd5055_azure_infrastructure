# Creates Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "${var.project}-vnet"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

# Subnet for AKS cluster
resource "azurerm_subnet" "aks" {
  name                 = "${var.project}-aks-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.aks_subnet_cidr]
}

# Subnet for other services (optional - for VMs, Azure DevOps agents)
resource "azurerm_subnet" "services" {
  name                 = "${var.project}-services-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.services_subnet_cidr]
}