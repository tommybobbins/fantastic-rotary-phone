resource "google_compute_instance" "primary" {
  name         = "cks-primary"
  machine_type = "e2-medium"
  zone         = "${var.region}-c"
  tags = ["hostname", "primary", "k8s", "udemy", "cks"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220419"
      size = 50
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.k8s-nodes.id


    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = "${file("cks-primary.sh")}"

}

