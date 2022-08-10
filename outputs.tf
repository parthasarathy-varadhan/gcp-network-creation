
# The  Terraform module outputs "mongodb_uri"
output "gcn_id" {
  value = data.google_compute_network.default.network_id
}

# The  Terraform module outputs "cluster_name"
output "gcsn_id" {
  value = data.google_compute_subnetwork.default.subnet_id
}