# Global
variable "resource_suffix_split" {
  type        = string
  description = "Suffix with - for for general resources"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created"
}

variable "resource_suffix" {
  type        = string
  description = "Suffix without - for storage account or according resources"
}

variable "application" {
  type        = string
  description = "Name of the Application"
}

variable "global_resource_suffix_split" {
  type        = string
  description = "Suffix with - for for general resources"
}

variable "global_resource_suffix" {
  type        = string
  description = "Suffix without - for storage account or according resources"
}

# Resource Group
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group"
}

# Key Vault
variable "kv_sku_name" {
  type        = string
  description = "The SKU of the Key Vault"
}

variable "kv_secret_permissions" {
  type        = list(string)
  description = "A list containing the permissions for secrets on the Key Vault"
}

#Application Insights
variable "application_type" {
  type        = string
  description = "Type of the Application Insights Application"
}

#APIM Management
variable "api_apim_sku_name" {
  description = "SKU"
  type        = string
}

variable "api_apim_publisher_name" {
  description = "Publisher name of the API Management'"
  type        = string
}

variable "api_apim_publisher_email" {
  description = "Publisher email of the API Management"
  type        = string
}

#Log Analytics
variable "log_analytics_sku"{
    type = string
    description = "Sku of the log analytics space"
}

variable "log_analytics_retention_in_days"{
    type = string
    description = "Sku of the log analytics space"
}

#ASP
variable "backend_reserved" {
  type        = bool
  description = "Set if resources should be reserved, in case of docker container must be true"
}

variable "backend_kind" {
  type        = string
  description = "Kind of the AppService Plan e.g. Linux or Windows"
}

variable "backend_tier" {
  type        = string
  description = "Tier of the AppService Plan"
}

variable "backend_size" {
  type        = string
  description = "Size of the AppService Plan"
}

#APP
variable "backend_image_address" {
  type        = string
  description = "Address of the Image to pull from"
}