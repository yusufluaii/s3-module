# Terraform Module


## HOW TO USE




1.  Create Bucket S3
    > <p>
         module "terraform_state" {
         source = "https://github.com/yusufluaii/terraform-module/tree/main/aws/modules/bucket-state"
         lock_is_needed = false
         bucket_name = var.my_bucket
         object_state = var.my_object  
         } 
      
     
    

2. then add configure backend with s3 and lock with dynamoDB
   > <p> 
        terraform {
        backend "s3" {
        bucket = (bucket-name)
        region = (region e.g = "ap-southeast-1")
        key = "global/s3/terraform.tfstate"
        dynamodb_table = "terraform-state-locking"
        encrypt = true
         }
        }
   

 **for dynamodb_table add comment if your module config locking_is_needed = false**

