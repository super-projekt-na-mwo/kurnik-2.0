terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }
}

provider "google-beta" {
  user_project_override = true
}

provider "google-beta" {
  alias = "no_user_project_override"
  user_project_override = false
}

resource "google_firebase_project" "kurnik" {
  provider = google-beta.no_user_project_override
  project  = var.project_id

  depends_on = [var.project_services]
}

