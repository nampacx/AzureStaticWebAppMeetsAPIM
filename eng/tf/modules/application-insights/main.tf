resource "azurerm_application_insights" "appinsights" {
  name                = replace("ai-${var.resource_suffix_split}", "application", var.application)
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = var.application_type
}

