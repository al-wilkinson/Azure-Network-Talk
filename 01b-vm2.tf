# Deploy a VM without a public IP to show implicit NAT
resource "azurerm_subnet" "snet2" {
  name                 = "snet-demo-02"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "vnic2" {
  name                = "nic-vm-demo-02"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ip-vm-demo-02"
    subnet_id                     = azurerm_subnet.snet2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm2" {
  name                = "vm-demo-02"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  size           = "Standard_B1s"
  admin_username = "adminuser"
  # Don't use passwords other than quick tear down tests
  disable_password_authentication = "false"
  admin_password                  = var.admin_password

  network_interface_ids = [azurerm_network_interface.vnic2.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

output "vm2_private_ip" {
  description = "IP address of the second deployed VM"
  value       = azurerm_linux_virtual_machine.vm2.private_ip_addresses
}