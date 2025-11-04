# Azure Configuration
subscription_id = "3fa8720e-5f35-48cf-b03c-c00a9f9fbf37"

# Project Configuration
project_name = "sd5055-azure-cicd-pipeline"
environment  = "dev"
owner        = "kiettranhatuan"

# Azure Region
location = "eastus"

# Network Configuration
vnet_cidr = "10.1.0.0/16"

# ACR Configuration
acr_name = "sd5055PracticalDevOpsRegistry"
acr_sku  = "Basic"

# AKS Configuration
aks_node_count   = 2                # Number of nodes
aks_node_vm_size = "Standard_B2s"   # Small VM for learning (2 vCPU, 4GB RAM)