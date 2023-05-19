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

variable "application_type" {
  type        = string
  description = "Type of the Application Insights Application"
}


