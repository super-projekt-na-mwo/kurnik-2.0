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