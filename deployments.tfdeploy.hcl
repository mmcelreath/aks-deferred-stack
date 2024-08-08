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
    azure_tenant_id       = "237fbc04-c52a-458b-af97-eaf7157c0cd4"
    azure_subscription_id = "c24643bf-3ef8-4f56-8a9c-adc6ec9c3633"
    identity_token_file   = identity_token.azure.jwt_filename
  }
}
