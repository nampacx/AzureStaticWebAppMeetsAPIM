resource "azurerm_app_service_plan" "plan" {
  name                = replace("plan-${var.resource_suffix_split}", "application", var.application)
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.kind
  reserved            = var.reserved

  sku {
    tier = var.tier
    size = var.size
  }
}


resource "azurerm_monitor_diagnostic_setting" "default" {
  name               = replace("plan-${var.resource_suffix_split}", "application", var.application)
  target_resource_id = azurerm_app_service_plan.plan.id
  log_analytics_workspace_id = var.log_analytics_workspace

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}