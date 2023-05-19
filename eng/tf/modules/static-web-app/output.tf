output "api_key" {
    description = "api key for static web app"
    value       = azurerm_static_site.website.api_key
}