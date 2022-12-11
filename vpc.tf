resource "google_compute_network" "example-k8s" {
  name                    = "example-k8s"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "k8s-nodes" {
  name          = "k8s-nodes"
  ip_cidr_range = "10.132.23.0/24"
  region        = var.region
  network       = google_compute_network.example-k8s.id
  #  secondary_ip_range {
  #    range_name    = "tf-test-secondary-range-update1"
  #    ip_cidr_range = "192.168.10.0/24"
  #  }
}

resource "google_compute_firewall" "internal" {
  project     = var.project
  name        = "internal-k8s-firewall"
  network     = google_compute_network.example-k8s.name
  description = "No internal firewall rules"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "ipip"
  }

  allow {
    protocol = "udp"
  }

<<<<<<< HEAD
<<<<<<< HEAD
  source_tags = ["test"]
  target_tags = ["test"]
=======
=======
>>>>>>> parent of 3700fee (Added nightly shutdown if project_lifecycle is development)
  source_tags = ["k8s"]
  target_tags = ["k8s"]
}

resource "google_compute_firewall" "rules" {
  project     = var.project
  name        = "k8s-firewall"
  network     = google_compute_network.example-k8s.name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
<<<<<<< HEAD
    ports    = ["80", "22", "8080", "1000-2000"]
=======
    ports    = ["80", "22","443", "8080", "30000-32500"]
>>>>>>> parent of 3700fee (Added nightly shutdown if project_lifecycle is development)
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "ipip"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = ["0.0.0.0/0"]
<<<<<<< HEAD
>>>>>>> parent of f431416 (Added test locals for PoC)
=======
>>>>>>> parent of 3700fee (Added nightly shutdown if project_lifecycle is development)
}
