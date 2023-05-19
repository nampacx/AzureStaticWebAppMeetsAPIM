output "key_vault_id" {
    description = "The resource ID of the Key Vault"
    value       = azurerm_key_vault.kv.id
}