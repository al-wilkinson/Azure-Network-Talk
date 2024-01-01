variable "admin_password" {
  description = "Just type it in.  Don't do this in prod."
  type = string
  sensitive = true
}