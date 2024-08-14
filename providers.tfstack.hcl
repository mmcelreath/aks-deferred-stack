# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 3.114.0"
  }
  kubernetes = {
    source  = "hashicorp/kubernetes"
    version = "~> 2.32.0"
  }
  random = {
    source = "hashicorp/random"
    version = "~> 3.6.2"
  }
}

provider "random" "main" {}

provider "azurerm" "main" {
  config {
    features {}
    use_cli              = false
    use_oidc             = true

    oidc_token_file_path = var.identity_token_file

    subscription_id      = var.azure_subscription_id
    tenant_id            = var.azure_tenant_id
    client_id            = var.azure_client_id
  }
}

provider "kubernetes" "main" {
  config {
    host                   = component.cluster.cluster_url
    cluster_ca_certificate = component.cluster.cluster_ca
    client_key             = component.cluster.cluster_client_key
    client_certificate     = component.cluster.cluster_client_certificate
  }
}
