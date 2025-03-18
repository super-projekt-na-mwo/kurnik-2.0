variable "project_information" {
  type = object({
    name = string
    id   = string
  })

  default = {
    name = "Better version of Kurnik"
    id   = "mwo-project-kurnik"
  }

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_information.id))
    error_message = "Project ID must contain only lowercase letters, numbers, and dashes."
  }
}

# variable "billing_account" {
#   type      = string
#   sensitive = true

#   validation {
#     condition     = can(regex("^[A-Z0-9-]+$", var.billing_account))
#     error_message = "Billing account ID must contain only uppercase letters, numbers, and dashes."
#   }
# }

variable "bucket_name" {
  type        = string
  description = "Unique name for the GCS bucket used for Terraform state storage"

  validation {
    condition     = can(regex("^[a-z0-9][-a-z0-9]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be 3-63 characters long, contain only lowercase letters, numbers, and dashes, and must start and end with a letter or number."
  }

  default = "kurnik-bucket-for-states"
}

variable "bucket_region"{
  type = string
  default = "EU"
}