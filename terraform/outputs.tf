output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

output "acr_login_server" {
  description = "ACR login server URL"
  value       = module.acr.acr_login_server
}

output "acr_admin_username" {
  description = "ACR admin username"
  value       = module.acr.acr_admin_username
  sensitive   = true
}

output "aks_name" {
  description = "AKS cluster name"
  value       = module.aks.aks_name
}

output "aks_fqdn" {
  description = "AKS cluster FQDN"
  value       = module.aks.aks_fqdn
}

# Instructions for connecting to AKS
output "get_credentials_command" {
  description = "Command to get AKS credentials"
  value       = "az aks get-credentials --resource-group ${module.resource_group.resource_group_name} --name ${module.aks.aks_name}"
}