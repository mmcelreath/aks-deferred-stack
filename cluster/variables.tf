# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "kubernetes_version" {
  default = "1.30"
}

variable "workers_count" {
  default = "1"
}

variable "cluster_name" {
  type = string
}

variable "location" {
  type = string
}