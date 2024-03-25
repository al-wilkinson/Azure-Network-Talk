resource "azurerm_subnet" "bast-snet" {
  name = "AzureBastionSubnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.3.0/24"]
}

resource "azurerm_public_ip" "pip-bastion-demo-01" {
  name                = "pip-bastion-demo-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "bastion-demo-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                 = "bastconfig"
    subnet_id            = azurerm_subnet.bast-snet.id
    public_ip_address_id = azurerm_public_ip.pip-bastion-demo-01.id
  }
}