#Update project level private access key
variable "GOOGLE_CREDENTIALS" {
  description = "GCP service account key. Remove the newline characters from your JSON key file and then paste the credentials into the environment variable value field. You can use the tr command to strip newline characters. cat key.json | tr -s '\n' ' '"
}

variable "GCP_PROJECT_ID" {
  default = "tranquil-matter-357619"
  description = "GCP project ID"
}

# Valid GCP Region names
variable "GCP_REGION_NAME" {
  default = "us-east1"
  type    = string
  description = "Mongodb atlas cluster region"
  validation {
    condition     = contains(["us-central1", "us-east1", "us-east4", "northamerica-northeast1", "northamerica-northeast2", "southamerica-east1", "southamerica-west1", "us-west1", "us-west2", "us-west3", "us-west4"], var.GCP_REGION_NAME)
    error_message = "Valid values for GCP region_name  are (us-central1 us-east1 us-east4 northamerica-northeast1 northamerica-northeast2 southamerica-east1 southamerica-west1 us-west1 us-west2 us-west3 us-west4)."
  }
}


# Must be a match of regex '(?:[a-z](?:[-a-z0-9]{0,61}[a-z0-9])?)'
variable "GOOGLE_COMPUTE_NETWORK_NAME" {
  default = "mongodbclusternetwork"
  description = "GCP project ID"
}

# Subnet name of the network
variable "GOOGLE_SUBNET_NAME" {
  default = "mongodbclustersubnet"
  description = "GCP subnet"
}





