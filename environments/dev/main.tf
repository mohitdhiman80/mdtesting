locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "dev"
  }
}
module "rg" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "rg-dev-todoapp-01"
  rg_location = "centralindia"
  rg_tags     = local.common_tags
}

module "sg" {
  source = "../../modules/azurerm_storage_account"
  sa_name = "sgdevmd01"
  rg_name      = "rg-dev-todoapp-01-md"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = local.common_tags
}

