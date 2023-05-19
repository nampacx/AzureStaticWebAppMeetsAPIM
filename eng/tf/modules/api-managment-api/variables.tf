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

variable "api_management_name" {
  description = "Name of the api management"
  type        = string
}

variable "revision" {
  description = "Number of the API revision"
  type        = string
}

variable "display_name" {
  description = "API name will display in APIM"
  type        = string
}

variable "path" {
  description = "The API path"
  type        = string
}

variable "protocols" {
  description = "List of protocols for API (HTTP, HTTPS)"
  type        = list(string)
}

variable "service_url" {
  description = "Service Url of the backend"
  type        = string
}