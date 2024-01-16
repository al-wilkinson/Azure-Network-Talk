# Add NAT Gateway
resource "azurerm_nat_gateway" "natgw" {
  name                    = "nat-Gateway"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
}

resource "azurerm_subnet_nat_gateway_association" "natgwassoc" {
  subnet_id      = azurerm_subnet.snet.id
  nat_gateway_id = azurerm_nat_gateway.natgw.id
}

resource "azurerm_subnet_nat_gateway_association" "natgwassoc-snet2" {
  subnet_id = azurerm_subnet.snet2.id
  nat_gateway_id = azurerm_nat_gateway.natgw.id
}

resource "azurerm_public_ip" "gwpip" {
  name                = "gwPIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "pipassoc" {
  nat_gateway_id       = azurerm_nat_gateway.natgw.id
  public_ip_address_id = azurerm_public_ip.gwpip.id
}
 
output "nat_gateway_public_ip" {
  description = "The public IP address of the NAT Gateway"
  value = azurerm_public_ip.gwpip.ip_address
} 