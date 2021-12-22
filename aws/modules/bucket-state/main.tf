provider "aws" {
  region = "ap-southeast-1"
}


resource "aws_s3_bucket" "object_state" {
    bucket = var.bucket_name
    acl = var.acl
    force_destroy = var.force_destroy

    tags = {
      Name = "${var.object_state}-state"
      Description = "the bucket where the ${var.object_state} state is stored"
    }
    lifecycle {
      prevent_destroy = false
    }
    versioning {
      enabled = var.versioning 
    }
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = var.sse_algorithm
        }
      }
    }
}


resource "aws_dynamodb_table" "terraform_locks" {
  count = var.lock_is_needed ? 1 : 0 
  name = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = var.hash_key
  attribute {
    name =  var.hash_key
    type = "S"
  }
}