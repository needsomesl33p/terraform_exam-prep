# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      hashicorp-learn = "resource-targeting"
    }
  }
}

resource "random_pet" "bucket_name" {
  length    = 4
  separator = "-"
  prefix    = "learning"
}

module "s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "4.1.0"
  bucket        = random_pet.bucket_name.id
  policy        = data.aws_iam_policy_document.bucket_police.json
  attach_policy = true
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "bucket_police" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]

    resources = ["${module.s3_bucket.s3_bucket_arn}/*", module.s3_bucket.s3_bucket_arn]

  }

}



resource "random_pet" "object_names" {
  count = 4

  length    = 5
  separator = "_"
  #prefix    = "learning"
}

resource "aws_s3_object" "objects" {
  count = 4

  acl    = "private"
  key    = "${random_pet.object_names[count.index].id}.txt"
  bucket = module.s3_bucket.s3_bucket_id
  #content      = "Example object #${count.index}" 
  content      = "Bucket object #${count.index}"
  content_type = "text/plain"

  depends_on = [module.s3_bucket]
}
