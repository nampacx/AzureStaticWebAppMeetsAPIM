resource "azurerm_app_service" "app" {
  name                = replace("app-${var.resource_suffix_split}", "application", var.application)
  resource_group_name = var.resource_group_name
  location            = var.location

  app_service_plan_id = var.app_service_plan_id

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = var.application_insights_key
  }

  site_config {
    # acr_use_managed_identity_credentials = true
    # linux_fx_version                     = "DOCKER|${var.image_address}"
    use_32_bit_worker_process = true
    cors {
      allowed_origins     = ["*"]
      support_credentials = false
    }

    default_documents = var.default_documents
  }

  identity {
    type = "SystemAssigned"
  }


  lifecycle {
    ignore_changes = [
      app_settings
    ]
  }
}

# resource "azurerm_role_assignment" "appServicePull" {
#   scope                = var.acr_Id
#   role_definition_name = "AcrPull"
#   principal_id         = azurerm_app_service.app.identity.0.principal_id
# }


resource "azurerm_key_vault_access_policy" "KeyVaultAccess" {
  key_vault_id = var.kv_id
  tenant_id    = var.tenant
  object_id    = azurerm_app_service.app.identity.0.principal_id

  key_permissions = [
    "Get", "List"
  ]

  secret_permissions = [
    "Get", "Set", "List"
  ]
}


resource "azurerm_monitor_diagnostic_setting" "default" {
  name               = replace("app-${var.resource_suffix_split}", "application", var.application)
  target_resource_id = azurerm_app_service.app.id
  log_analytics_workspace_id = var.log_analytics_workspace

  log {
    category = "AppServiceHTTPLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }


    log {
    category = "AppServiceConsoleLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

    log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }



    log {
    category = "AppServiceAuditLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }


log {
    category = "AppServiceIPSecAuditLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }


log {
    category = "AppServicePlatformLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }




  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}