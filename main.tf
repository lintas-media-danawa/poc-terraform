# Enable Cloud Run API
resource "google_project_service" "run" {
  service = "run.googleapis.com"
}

# Enable Artifact Registry API
resource "google_project_service" "artifact" {
  service = "artifactregistry.googleapis.com"
}

# Cloud Run Service
resource "google_cloud_run_v2_service" "default" {
  name     = var.service_name
  location = var.region

  template {
    containers {
      image = var.image_name

      ports {
        container_port = 8080
      }
    }
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }
}

# Memberikan akses publik (tanpa autentikasi)
resource "google_cloud_run_service_iam_member" "invoker" {
  location = var.region
  project  = var.project_id
  service  = google_cloud_run_v2_service.default.name

  role   = "roles/run.invoker"
  member = "allUsers"
}