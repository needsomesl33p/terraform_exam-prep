# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  /* Uncomment this block to use Terraform Cloud for this tutorial
  cloud {
    organization = "organization-name"
    workspaces {
      name = "learn-terraform-provider-versioning"
    }
  }
  */

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.5.0" => 5.38
      #version = "~> 5.0.0" => 5.0.1 rightmost!
      #version = "~> 5.5.0" => 5.5.0
      #version = "~> 5.0" => 5.38
      #version = ">= 5.0.0, <= 5.30" => 5.30
    }
  }

  required_version = "~> 1.2"
}
