# terraform {
#   backend "s3" {
#     bucket = "luai-terraform-state"
#     region = "ap-southeast-1"
#     key = "global/s3/terraform.tfstate"
#     # dynamodb_table = "terraform-state-locking"
#     encrypt = true
#   }
  
# }


module "terraform_state_bucket" {
  source = "github.com/yusufluaii/terraform-module/aws/modules/bucket-state"
  lock_is_needed = false
  bucket_name = var.my_bucket
  object_state = var.my_object
}
