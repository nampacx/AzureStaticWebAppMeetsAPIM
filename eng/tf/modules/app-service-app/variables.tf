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
  type        = string
  description = "The location of the Azure resources"
}

variable "app_service_plan_id" {
  type        = string
  description = "Id of the AppService Plan"
}

variable "application_insights_key" {
  type        = string
  description = "Key for the Application Insights Instance"
}

variable "image_address" {
  type        = string
  description = "Address of the Image to pull from"
}

variable "kv_id" {
  type        = string
  description = "Id of the Kv"
}

variable "tenant" {
  type        = string
  description = "Teanant"
}

variable "log_analytics_workspace" {
  type        = string
  description = "Contains Log Analytics Wokspace ID"
}

variable "default_documents" {
  type        = list(string)
  description = "List of default documents"
  default = []
}
