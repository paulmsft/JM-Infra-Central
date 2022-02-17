# Create app service plan
resource "azurerm_app_service_plan" "asp" {
    name                         = lower(var.asp_name)
    location                     = var.location
    resource_group_name          = upper(var.app_rg_name)
    kind                         = var.asp_kind
    reserved                     = var.asp_reserved
    maximum_elastic_worker_count = var.asp_max_ew_count
    tags                         = var.tags

    sku {
      capacity = var.asp_capacity
      size     = var.asp_size
      tier     = var.asp_tier
    }
}

# Create app service web app
resource "azurerm_app_service" "web_app" {
    name                = lower(var.app_name)
    resource_group_name = upper(var.app_rg_name)
    location            = var.location
    app_service_plan_id = azurerm_app_service_plan.asp.id
    client_cert_mode    = var.app_cert_mode
    app_settings        = var.app_settings
    tags                = var.tags
    
    site_config {
      number_of_workers        = var.app_site_cfg_num_workers
      linux_fx_version         = var.app_linux_fx_version
      dotnet_framework_version = var.app_dotnet_version
      remote_debugging_version = var.app_rmt_debug_version
      app_command_line         = var.app_cmd_line
      ftps_state               = var.app_ftps_state
      vnet_route_all_enabled   = var.route_all_enabled
    }
}
