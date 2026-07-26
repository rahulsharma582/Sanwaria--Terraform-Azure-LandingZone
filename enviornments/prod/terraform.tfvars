rgs = {
  rg1 = {
    name     = "rg-1"
    location = "centralindia"
  }
}

vnet = {
  vnet1 = {
    name                = "vnet-1"
    location            = "centralindia"
    resource_group_name = "rg-1"
    address_space       = ["10.0.0.0/16"]
  }
}

snet = {
  snet1 = {
    name                 = "snet-1"
    resource_group_name  = "rg-1"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "snet-2"
    resource_group_name  = "rg-1"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.2.0/24"]
  }

  snet_app = {
    name                 = "snet-app"
    resource_group_name  = "rg-1"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.3.0/24"]
  }

  snet_db = {
    name                 = "snet-db"
    resource_group_name  = "rg-1"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.4.0/24"]
  }

  snet_appgw = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-1"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.5.0/24"]
  }
}

pip = {
  pip1 = {
    name                = "pip-1"
    resource_group_name = "rg-1"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip_appgw = {
    name                = "pip-appgw"
    resource_group_name = "rg-1"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nic = {
  nic1 = {
    name                          = "nic-1"
    resource_group_name           = "rg-1"
    location                      = "centralindia"
    ip_configuration_name         = "Internal"
    virtual_network_name          = "vnet-1"
    subnet_name                   = "snet-1"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "pip-1"
  }

  nic2 = {
    name                          = "nic-2"
    resource_group_name           = "rg-1"
    location                      = "centralindia"
    ip_configuration_name         = "Internal"
    virtual_network_name          = "vnet-1"
    subnet_name                   = "snet-2"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "pip-1"
  }

  nic_app = {
    name                          = "nic-app1"
    resource_group_name           = "rg-1"
    location                      = "centralindia"
    ip_configuration_name         = "Internal"
    virtual_network_name          = "vnet-1"
    subnet_name                   = "snet-app"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "pip-1"
  }

  nic_db = {
    name                          = "nic-db1"
    resource_group_name           = "rg-1"
    location                      = "centralindia"
    ip_configuration_name         = "Internal"
    virtual_network_name          = "vnet-1"
    subnet_name                   = "snet-db"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "pip-1"
  }
}

vm = {
  vm1 = {
    name                   = "vm-1"
    resource_group_name    = "rg-1"
    location               = "centralindia"
    size                   = "Standard_B1s"
    admin_username         = "Devopsadmin"
    admin_password         = "Admin@123"
    network_interface_name = "nic1"
    caching                = "ReadWrite"
    storage_account_type   = "Standard_LRS"
    publisher              = "Canonical"
    offer                  = "0001-com-ubuntu-server-jammy"
    sku                    = "22_04-lts"
    version                = "latest"
  }

  vm2 = {
    name                   = "vm-2"
    resource_group_name    = "rg-1"
    location               = "centralindia"
    size                   = "Standard_B1s"
    admin_username         = "Devopadmin1"
    admin_password         = "Admin@123"
    network_interface_name = "nic1"
    caching                = "ReadWrite"
    storage_account_type   = "Standard_LRS"
    publisher              = "Canonical"
    offer                  = "0001-com-ubuntu-server-jammy"
    sku                    = "22_04-lts"
    version                = "latest"
  }
}

app_vm = {
  app_vm1 = {
    name                   = "vm-app1"
    resource_group_name    = "rg-1"
    location               = "centralindia"
    size                   = "Standard_B1s"
    admin_username         = "Devopsadmin"
    admin_password         = "Admin@123"
    network_interface_name = "nic-app1"
    caching                = "ReadWrite"
    storage_account_type   = "Standard_LRS"
    publisher              = "Canonical"
    offer                  = "0001-com-ubuntu-server-jammy"
    sku                    = "22_04-lts"
    version                = "latest"
  }
}

db_vm = {
  db_vm1 = {
    name                   = "vm-db1"
    resource_group_name    = "rg-1"
    location               = "centralindia"
    size                   = "Standard_B2s"
    admin_username         = "Devopsadmin"
    admin_password         = "Admin@123"
    network_interface_name = "nic-db1"
    caching                = "ReadWrite"
    storage_account_type   = "Standard_LRS"
    publisher              = "Canonical"
    offer                  = "0001-com-ubuntu-server-jammy"
    sku                    = "22_04-lts"
    version                = "latest"
    create_data_disk       = true
    data_disk_size_gb      = 20
    data_disk_type         = "Standard_LRS"
  }
}

ilb = {
  ilb1 = {
    name                 = "ilb-1"
    resource_group_name  = "rg-1"
    location             = "centralindia"
    subnet_name          = "snet-app"
    virtual_network_name = "vnet-1"
    backend_nic_name     = "nic-app1"
    frontend_port        = 80
    backend_port         = 80
    probe_port           = 80
    probe_protocol       = "Tcp"
  }
}

appgw = {
  appgw1 = {
    name                 = "appgw-1"
    resource_group_name  = "rg-1"
    location             = "centralindia"
    subnet_name          = "AppGatewaySubnet"
    virtual_network_name = "vnet-1"
    public_ip_name       = "pip-appgw"
    sku_name             = "Standard_v2"
    sku_tier             = "Standard_v2"
    capacity             = 2
    frontend_port        = 80
    backend_port         = 80
    listener_protocol    = "Http"
    backend_protocol     = "Http"
    rule_priority        = 100
  }
}
