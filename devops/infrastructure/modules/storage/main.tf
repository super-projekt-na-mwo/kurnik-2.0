resource "google_storage_bucket" "state-files" {
  provider                    = google-beta
  name                        = var.bucket_name
  location                    = var.region
  project                     = var.project_id
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

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [ var.google_project ]
}