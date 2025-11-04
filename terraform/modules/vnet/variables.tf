variable "project" {
  description = "Project name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_cidr" {
  description = "VNet CIDR block"
  type        = string
  default     = "10.1.0.0/16"
}

variable "aks_subnet_cidr" {
  description = "AKS subnet CIDR"
  type        = string
  default     = "10.1.1.0/24"
}

variable "services_subnet_cidr" {
  description = "Services subnet CIDR"
  type        = string
  default     = "10.1.2.0/24"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}