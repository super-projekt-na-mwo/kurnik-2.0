resource "google_storage_bucket" "state-files" {
  provider                    = google-beta
  name                        = var.bucket_name
  location                    = var.bucket_region
  project                     = var.project_information.id
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365 
    }
  }
}