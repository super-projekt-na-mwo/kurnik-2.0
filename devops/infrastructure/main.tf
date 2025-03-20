terraform {
  backend "gcs" {
    bucket = "kurnik-bucket-for-states"
    prefix = "terraform/state"
  }
}

module "project" {
  source    = "./modules/project"
  project_information = var.project_information
}

module "firebase" {
  source    = "./modules/firebase"
  project_id = module.project.project_id
  project_services = module.project.project_services
  google_project = module.project.google_project
}

module "storage" {
  source    = "./modules/storage"
  google_project = module.project.google_project
  project_id = module.project.project_id
  bucket_name = var.bucket_name
  region = var.region
}