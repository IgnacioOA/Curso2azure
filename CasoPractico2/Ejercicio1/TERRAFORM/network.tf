# Creación de red
resource "azurerm_virtual_network" "myNet" {
  name                = "vnet-ejercicio1"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "casopractico2"
  }
}

# Creación de subred
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-ejercicio1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# IP pública
resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-ejercicio1"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    environment = "casopractico2"
  }
}

# Creación de interfaz de red NIC
resource "azurerm_network_interface" "nic" {
  name                = "nic-ejercicio1"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = {
    environment = "casopractico2"
  }
}
