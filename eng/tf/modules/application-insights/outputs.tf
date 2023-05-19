output "instrumentation_key" {
  description = "AppInsights instrumentation Key"
  value       = azurerm_application_insights.appinsights.instrumentation_key
}
