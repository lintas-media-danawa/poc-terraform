variable "project_id" {}
variable "region" {
  default = "asia-southeast2"
}
variable "service_name" {
  default = "my-cloud-run-app"
}
variable "image_name" {
  description = "Container image full path (e.g. gcr.io/project-id/image-name:tag)"
}