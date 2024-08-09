# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.114.0"
    }
  }
}

# provider "azurerm" {
#     features {
#     }
# }

locals {
  cluster_name = "${var.cluster_name}-${random_string.demo.result}"
}

resource "random_string" "demo" {
  length = 4
  special = false
  upper = false
}

resource "azurerm_resource_group" "default" {
  name     = local.cluster_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = local.cluster_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = local.cluster_name

  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name       = "demo"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    upgrade_settings {
        max_surge = "10%"
        node_soak_duration_in_minutes = 0
        drain_timeout_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }
}