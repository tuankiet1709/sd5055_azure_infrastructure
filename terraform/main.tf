terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  
  subscription_id = var.subscription_id
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }
}

# Resource Group Module
module "resource_group" {
  source = "../../modules/resource-group"

  resource_group_name = "${var.project_name}-${var.environment}-rg"
  location            = var.location
  tags                = local.common_tags
}

# VNet Module
module "vnet" {
  source = "../../modules/vnet"

  project             = var.project_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  vnet_cidr           = var.vnet_cidr
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

# ACR Module
module "acr" {
  source = "../../modules/acr"

  registry_name       = var.acr_name # Must be globally unique
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  sku                 = var.acr_sku
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

# AKS Module
module "aks" {
  source = "../../modules/aks"

  project             = var.project_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  subnet_id           = module.vnet.aks_subnet_id
  node_count          = var.aks_node_count
  node_vm_size        = var.aks_node_vm_size
  acr_id              = module.acr.acr_id
  tags                = local.common_tags

  depends_on = [module.vnet, module.acr]
}