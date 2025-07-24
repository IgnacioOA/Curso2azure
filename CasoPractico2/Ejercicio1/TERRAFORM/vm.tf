
#Creamos una VM con Linux y Ubuntu Server 22.04 LTS
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-nginx"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [azurerm_network_interface.nic.id]

    admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub") 
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

# Configuración de la imagen del sistema operativo Ubuntu Server 22.04 LTS
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }  

  tags = {
    environment = "casopractico2"
  }
}
