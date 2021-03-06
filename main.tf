provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.ENV}-${var.resource_group_name}"
  location = var.resource_group_location
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.ENV}-${var.azurerm_service_plan_name}"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
  depends_on = [
    azurerm_resource_group.rg
  ]
}
resource "azurerm_app_service" "app_service" {
  name                = "${var.ENV}-${var.azurerm_app_service_name}"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id
  site_config {
    use_32_bit_worker_process = true
    linux_fx_version          = "PHP|7.4"
    ftps_state                = "Disabled"
    http2_enabled             = "true"
    min_tls_version           = "1.2"
  }
  depends_on = [
    azurerm_service_plan.app_service_plan
  ]
}
