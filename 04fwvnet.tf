resource "azurerm_virtual_network" "fwvnet" {
  name                = "fwvnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "fwsnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.fwvnet.name
  address_prefixes     = ["10.1.2.0/24"]
}

resource "azurerm_virtual_network_peering" "peer1" {
  name                      = "vnet1_to_fwvnet_peer"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = azurerm_virtual_network.fwvnet.id
}

resource "azurerm_virtual_network_peering" "peer2" {
  name                      = "fwvnet_to_vnet1_peer"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.fwvnet.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
}