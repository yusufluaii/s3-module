variable "sse_algorithm" {
  default = "AES256"
}

variable "bucket_name" {
  default = "luai-terraform-state"
}

variable "object_state" {
  default = "terraform"
}

variable "hash_key" {
  default = "LockID"
}

variable "lock_is_needed"{
    description = "If set to true, enable locking state"
}

variable "acl" {
  default = "private"
}

variable "force_destroy" {
  default = true
}



variable "versioning" {
  default = false
}