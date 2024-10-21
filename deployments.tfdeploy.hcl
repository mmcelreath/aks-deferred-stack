# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "azure" {
  audience = ["stacks-demo"]
}

deployment "demo" {
  inputs = {
    cluster_name          = "stacks-demo"
    kubernetes_version    = "1.30"
    location              = "westeurope"

    identity_token_file   = identity_token.azure.jwt_filename

    azure_subscription_id = "4a2ff90e-c796-4555-acdb-1bff040071db"
    azure_tenant_id       = "d3fdf2cb-8ef1-4940-8043-69170342d935"
    azure_client_id       = "71975bc3-1447-42bf-9415-f13200cf91fe"
  }
}
