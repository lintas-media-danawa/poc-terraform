provider "google" {
  // credentials = file("lmd-development-467415-a237bb25a2a6.json")
  credentials = var.gcp_sa_key
  project     = var.project_id
  region      = var.region
}