# Configure the MongoDB Atlas Provider
#
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.31.0"
    }
  }
}

provider "google" {
  project     = var.GCP_PROJECT_ID
  region      = var.GCP_REGION_NAME
}

# Create a Google Network
resource "google_compute_network" "default" {
  project = var.GCP_PROJECT_ID
  name    = var.GOOGLE_COMPUTE_NETWORK_NAME
}

# Create a Google Sub Network
resource "google_compute_subnetwork" "default" {
  project       = google_compute_network.default.project
  name          = var.GOOGLE_SUBNET_NAME
  ip_cidr_range = "10.0.0.0/26"
  region        = var.GCP_REGION_NAME
  network       = google_compute_network.default.id
}