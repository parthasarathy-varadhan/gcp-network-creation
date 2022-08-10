
# The  Terraform module outputs "mongodb_uri"
output "gcn_id" {
  value = google_compute_network.default.id
}

# The  Terraform module outputs "cluster_name"
output "gcsn_id" {
  value = google_compute_subnetwork.default.id
}