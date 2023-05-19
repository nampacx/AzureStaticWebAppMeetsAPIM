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

variable "reserved" {
  type        = bool
  description = "Set if resources should be reserved, in case of docker container must be true"
}

variable "kind" {
  type        = string
  description = "Kind of the AppService Plan e.g. Linux or Windows"
}

#SKU
variable "tier" {
  type        = string
  description = "Tier of the AppService Plan"
}

variable "size" {
  type        = string
  description = "Size of the AppService Plan"
}

variable "log_analytics_workspace" {
  type        = string
  description = "Contains Log Analytics Wokspace ID"
}
