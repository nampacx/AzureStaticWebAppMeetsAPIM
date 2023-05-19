resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = replace("log-${var.resource_suffix_split}", "application", var.application)
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}