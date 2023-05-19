variable "resource_suffix_split" {
  type        = string
  description = "Suffix of the ressource"
}

variable "application" {
  type        = string
  description = "Name of the Application"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group"
}

variable "location" {
  type        = string
  description = "The location of the Azure resources"
}

variable "tenant_id" {
  type        = string
  description = "The ID of the Azure tenant"
}

variable "pipeline_principal_oid" {
  type        = string
  description = "The Object ID of the Service Principal of the DevOps Service Connection"
}

variable "kv_sku_name" {
  type        = string
  description = "The SKU of the Key Vault"
}

variable "kv_secret_permissions" {
  type        = list(string)
  description = "A list containing the permissions for secrets on the Key Vault"
}


variable "log_analytics_workspace" {
  type        = string
  description = "Contains Log Analytics Wokspace ID"
}
