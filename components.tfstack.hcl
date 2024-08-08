# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "cluster" {
  source = "./cluster"

  providers = {
    azurerm = provider.azurerm.main
    random = provider.random.main
  }

  inputs = {
    cluster_name       = var.cluster_name
    kubernetes_version = var.kubernetes_version
    location = var.location
  }
}

# component "kube" {
#   source = "./kube"

#   providers = {
#     kubernetes = provider.kubernetes.main
#   }
# }
