terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">2.66.0"
    }
  }
  backend "azurerm" {
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true

  features {}
}

data "azurerm_client_config" "client" {

}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     =  replace("rg-${var.resource_suffix_split}", "application", var.application)
}

#LAW Module
module "log_analytics"{
  source                = "./modules/log-analytics"
  application           = var.application
  resource_suffix_split = var.resource_suffix_split
  resource_group_name   = var.resource_group_name
  location              = azurerm_resource_group.rg.location
  sku= var.log_analytics_sku
  retention_in_days = var.log_analytics_retention_in_days
}

#KV Module
module "kv" {
  source                  = "./modules/key-vault"
  application             = var.application
  resource_suffix_split   = var.resource_suffix_split
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  tenant_id               = data.azurerm_client_config.client.tenant_id
  pipeline_principal_oid  = data.azurerm_client_config.client.object_id
  kv_sku_name             = var.kv_sku_name
  kv_secret_permissions   = var.kv_secret_permissions
  log_analytics_workspace = module.log_analytics.log_analytics_workspace_id 
}

#Application Inisghts
module "appinsights" {
  source                = "./modules/application-insights"
  application           = var.application
  resource_suffix_split = var.resource_suffix_split
  resource_group_name   = var.resource_group_name
  location              = azurerm_resource_group.rg.location
  application_type      = var.application_type
}

#API Management
module "apim" {
   source                   = "./modules/api-managment"
   application              = var.application
   resource_suffix_split    = var.resource_suffix_split
   resource_group_name      = azurerm_resource_group.rg.name
   location                 = azurerm_resource_group.rg.location
   api_apim_sku_name        = var.api_apim_sku_name
   api_apim_publisher_name  = var.api_apim_publisher_email
   api_apim_publisher_email = var.api_apim_publisher_email
 }

module "be-plan" {
  source                = "./modules/app-service-plan"
  application           = "gpt-be-windows"
  resource_suffix_split = var.resource_suffix_split
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  kind                  = var.backend_kind
  tier                  = var.backend_tier
  size                  = var.backend_size
  reserved              = var.backend_reserved
  log_analytics_workspace = module.log_analytics.log_analytics_workspace_id
}

module "be_appService" {
  source                   = "./modules/app-service-app"
  application              = "backend"
  resource_suffix_split    = var.resource_suffix_split
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  app_service_plan_id      = module.be-plan.plan_id
  application_insights_key = module.appinsights.instrumentation_key
  image_address            = var.backend_image_address
  tenant                   = data.azurerm_client_config.client.tenant_id
  kv_id                    = module.kv.key_vault_id
  log_analytics_workspace = module.log_analytics.log_analytics_workspace_id
}

module "apim_api" {
  source                = "./modules/api-managment-api"
  application           = "gpt"
  resource_suffix_split = var.resource_suffix_split
  resource_group_name   = azurerm_resource_group.rg.name
  api_management_name   = module.apim.name
  revision              = "v1"
  display_name          = "gpt"
  path                  = "gpt"
  protocols             = ["https"]
  service_url           = module.be_appService.service_url
}