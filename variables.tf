variable "admin_password" {
  description = "Just type it in.  Don't do this in prod."
  type        = string
  sensitive   = true
}

# Define our IP address or range to use in NSG and Azure firewall for SSH access
variable "where_we_are_at" {
  description = "IP address we are working from to use in NSG and firewall for SSH access."
  type = string
  default = "14.202.22.1/32"
}

# 01a-vm.tf 
variable "resource_group_name" {
  description = "Name of resource group to deploy to."
  type        = string
  default     = "vm-rg"
}

variable "Location" {
  description = "Azure location for deployment."
  type        = string
  default     = "Australia East"
}

variable "vnet_ip" {
  description = "IP address range for virtual network vnet1"
  type = string
  default = "10.0.0.0/16"
}

variable "snet1_ip" {
  description = "Network address for snet1"
  type = string
  default = "10.0.1.0/24"
}

# Leave snet2's IP range hard coded as second VM and VNet will not always be deployed.