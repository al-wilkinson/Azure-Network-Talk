resource "azurerm_firewall_policy" "fwpol" {
  name                = "fwpol"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_firewall_policy_rule_collection_group" "fwpolrule_collection_group" {
  name               = "example-fwpolicy-rcg"
  firewall_policy_id = azurerm_firewall_policy.fwpol.id
  priority           = 500
  application_rule_collection {
    name     = "app_rule_collection1"
    priority = 500
    action   = "Deny"
    rule {
      name = "app_rule_collection1_rule1"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = ["10.0.0.1"]
      destination_fqdns = ["*.microsoft.com"]
    }
  }
}

resource "azurerm_firewall_nat_rule_collection" "natcollection" {
  name = "nat-rule-collection"
  azure_firewall_name = azurerm_firewall.fw.name
  resource_group_name = azurerm_resource_group.rg.name
  priority = 400
  action = "Dnat"

  rule {
    name = "testdnatrule"
    source_addresses = ["0.0.0.0/0",]
    destination_ports = ["22",]
    destination_addresses = [ azurerm_public_ip.fwpip.ip_address, ]
    translated_port = 22
    translated_address = azurerm_linux_virtual_machine.vm.private_ip_addresses[0]
    protocols = ["TCP",]
  }
}
