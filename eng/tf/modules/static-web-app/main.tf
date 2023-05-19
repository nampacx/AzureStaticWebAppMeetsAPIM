resource "azurerm_static_site" "website" {
  name                = replace("swa-${var.resource_suffix_split}", "application", var.application)
  resource_group_name = var.resource_group_name
  location            = var.location
}