# output "public_ip" {
#   value = azurerm_public_ip.test.ip_address
# }

output "vm_ids" {
  value = azurerm_linux_virtual_machine.test[*].id
}

output "private_key" {
  value     = azapi_resource_action.ssh_public_key_gen.output.privateKey
  sensitive = true
}