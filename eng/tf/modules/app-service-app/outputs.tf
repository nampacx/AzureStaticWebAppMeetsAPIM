output "service_url" {
    description = "Service URL of the Deployed AppService"
    value       = azurerm_app_service.app.default_site_hostname
}