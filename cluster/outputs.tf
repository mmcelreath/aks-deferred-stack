output "cluster_url" {
    sensitive = true
  value = azurerm_kubernetes_cluster.default.kube_config.0.host
}

output "cluster_ca" {
    sensitive = true
    value = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}

output "cluster_client_certificate" {
    sensitive = true
    value = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
}

output "cluster_client_key" {
    sensitive = true
    value = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_key)
}