# Create storage share
resource "azurerm_storage_share" "share" {
  name                 = lower(var.share_name)
  storage_account_name = var.sta_name
  quota                = var.share_quota
}
