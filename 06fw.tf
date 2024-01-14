resource "azurerm_public_ip" "fwpip" {
  name                = "fwpip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fw" {
  name                = "fw-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  firewall_policy_id = azurerm_firewall_policy.fwpol.id

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.fwsnet.id
    public_ip_address_id = azurerm_public_ip.fwpip.id
  }
}

output "fw_priv_ip" {
  description = "Private IP address of the Azure Firewall"
  value = azurerm_firewall.fw.ip_configuration[0].private_ip_address
}

resource "azurerm_route_table" "rm" {
  name = "rt1"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  disable_bgp_route_propagation = false

  route {
    name = "def-route"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.fw.ip_configuration[0].private_ip_address
  }
}