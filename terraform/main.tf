resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
}

resource "azurerm_user_assigned_identity" "this" {
  location            = azurerm_resource_group.this.location
  name                = var.name
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = var.name
  kubernetes_version  = "1.27.3"

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }

  automatic_channel_upgrade = "node-image"
}
# resource "azurerm_federated_identity_credential" "this" {
#   name                = var.name
#   resource_group_name = azurerm_resource_group.this.name
#   audience            = ["api://AzureADTokenExchange"]
#   issuer              = azurerm_kubernetes_cluster.this.oidc_issuer_url
#   parent_id           = azurerm_user_assigned_identity.this.id
#   subject             = "system:serviceaccount:XXX:YYY"
# }
resource "local_file" "foo" {
  content  = azurerm_kubernetes_cluster.this.kube_config_raw
  filename = "/home/vscode/.kube/config"
}
