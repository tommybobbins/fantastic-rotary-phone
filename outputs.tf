output "test_concat" {
  value = local.region_user_project
}

output "primary_ip" {
  value = google_compute_instance.primary.network_interface.0.network_ip
}

output "secondary_ip" {
  value = google_compute_instance.secondary.network_interface.0.network_ip
}
