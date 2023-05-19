output "log_analytics_workspace_id" {
    description = "The resource ID of the Log Analytics Workspace"
    value       = azurerm_log_analytics_workspace.log_analytics.id
}