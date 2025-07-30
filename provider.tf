provider "google" {
  credentials = file("lmd-development-467415-a237bb25a2a6.json")
  project     = var.project_id
  region      = var.region
}