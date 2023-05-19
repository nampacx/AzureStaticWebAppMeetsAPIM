resource "azurerm_key_vault" "kv" {
  name                = replace("kv-${var.resource_suffix_split}", "application", var.application)
  resource_group_name = var.resource_group_name
  location            = var.location

  tenant_id = var.tenant_id

  sku_name = var.kv_sku_name
  
  lifecycle {
    ignore_changes = [
      access_policy
    ]
  }
}

resource "azurerm_key_vault_access_policy" "default" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.pipeline_principal_oid

  secret_permissions = var.kv_secret_permissions
}

#resource "azurerm_monitor_diagnostic_setting" "default" {
#  name               = replace("kv-${var.resource_suffix_split}", "application", var.application)
#  target_resource_id = azurerm_key_vault.kv.id
#  log_analytics_workspace_id = var.log_analytics_workspace

 # log {
#    category = "audit"
 #   enabled  = true

 #   retention_policy {
 #     enabled = false
 #   }
 # }

#  log {
#    category = "allLogs"
#    enabled  = true#

#    retention_policy {
#      enabled = false
#    }
#  }


#  metric {
#    category = "AllMetrics"

#    retention_policy {
#      enabled = false
#    }
#  }
#}