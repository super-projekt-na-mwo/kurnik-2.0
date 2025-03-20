resource "google_firebase_project" "kurnik" {
  provider = google-beta.no_user_project_override
  project  = var.project_id

  depends_on = [var.project_services, var.google_project]
}