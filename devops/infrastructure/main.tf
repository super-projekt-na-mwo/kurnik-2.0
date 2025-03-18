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
  project_id = var.project_information.id
  project_services = module.project.project_services
}

module "storage" {
  source    = "./modules/storage"
  project_id = var.project_information.id
  bucket_name = var.bucket_name
}