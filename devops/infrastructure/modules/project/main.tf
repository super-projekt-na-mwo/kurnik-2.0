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

resource "google_project" "kurnik" {
  provider   = google-beta.no_user_project_override

  name       = var.project_information.name
  project_id = var.project_information.id

  labels = {
    "firebase" = "enabled"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [ billing_account ]
  }
}

resource "google_project_service" "kurnik" {
  provider = google-beta.no_user_project_override
  project  = google_project.kurnik.project_id
  for_each = toset([
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "firebase.googleapis.com",
    "serviceusage.googleapis.com",
  ])
  service = each.key

  disable_on_destroy = false
}