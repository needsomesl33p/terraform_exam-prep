# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Terraform configuration


import {
  id = "8fedf264255987e0a5e26107cc64fa374bea3a63430846bea55b245d564fbc98"
  to = docker_container.web
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
