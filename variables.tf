variable "admin_password" {
  description = "Just type it in.  Don't do this in prod."
  type = string
  sensitive = true
}

# 01vm.tf 
variable "resource_group_name" {
  description = "Name of resource group to deploy to."
  type = string
  default = "vm-rg"
}

variable "Location" {
  description = "Azure location for deployment."
  type = string
  default = "Australia East"
}