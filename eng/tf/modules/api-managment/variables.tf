variable "resource_suffix_split" {
  type        = string
  description = "Suffix of the ressource"
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group"
}

variable "application" {
  type        = string
  description = "Name of the Application"
}

variable "location" {
  description = "Azure location where the resources are deployed to"
  type        = string
}

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
