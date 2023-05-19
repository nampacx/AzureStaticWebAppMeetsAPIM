resource "azurerm_api_management" "apim" {
  name                = replace("apim-${var.resource_suffix_split}", "application", var.application)
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.api_apim_publisher_name
  publisher_email     = var.api_apim_publisher_email
  sku_name            = var.api_apim_sku_name
  identity {
    type = "SystemAssigned"
  }
}
