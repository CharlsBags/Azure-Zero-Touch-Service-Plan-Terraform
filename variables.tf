variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "location "
}

variable "azurerm_service_plan_name" {
  type        = string
  description = "name of the app service plan"
}
variable "azurerm_app_service_name" {
  type        = string
  description = "name of the app service plan"
}
variable "ENV" {
  description = "Env var"
  type        = string
}