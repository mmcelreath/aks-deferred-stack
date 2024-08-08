# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 3.114.0"
  }
  # kubernetes = {
  #   source  = "hashicorp/kubernetes"
  #   version = "~> 2.31.0"
  # }
  random = {
    source = "hashicorp/random"
    version = "~> 3.6.2"
  }
}

provider "random" "main" {}

provider "azurerm" "main" {
  config {
    features {}
    skip_provider_registration = true
    use_cli              = false
    use_oidc             = true
    subscription_id      = var.azure_subscription_id
    tenant_id            = var.azure_tenant_id
    oidc_token_file_path = var.identity_token_file

    client_id = "38665fa8-3166-41c8-bdf6-62c4ef26eb1e/federatedIdentityCredential/081f65c4-7040-4a46-9ce9-790799f921fe"
  }
}

# provider "kubernetes" "main" {
#   config {
#     host                   = component.cluster.cluster_url
#     cluster_ca_certificate = component.cluster.cluster_ca
#     client_key             = component.cluster.cluster_client_key
#     client_certificate     = component.cluster.cluster_client_certificate
#   }
# }
