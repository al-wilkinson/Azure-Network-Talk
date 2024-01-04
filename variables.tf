variable "admin_password" {
  description = "Just type it in.  Don't do this in prod."
  type        = string
  sensitive   = true
}

# Define our IP address or range to use in NSG and Azure firewall for SSH access
variable "where_we_are_at" {
  description = "IP address we are working from to use in NSG and firewall for SSH access."
  type = string
  default = "10.0.2.0/24"
}

# 01vm.tf 
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