terraform {
 backend "gcs" {
   project = "comp698-lm2020"
   bucket  = "comp698-lm2020-terraform-state"
   prefix  = "terraform-state"
 }
}
provider "google" {
  region = "us-central1"
}

resource "google_compute_instance_template" "terraform-staging" {
  name = "terraform-staging"
  project = "comp698-lm2020"
  disk {
    source_image = "cos-cloud/cos-stable"
  }
  machine_type = "n1-standard-1"
  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["http-server"]

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_write",
    ]
  }
  metadata {
      gce-container-declaration = <<EOF
  spec:
    containers:
    - image: 'gcr.io/comp698-lm2020/github-lmukanovic-comp698-final:7160fafc0600958aee4b51ba5f75be06b324558b'
      name: service-container
      stdin: false
      tty: false
    restartPolicy: Always
EOF
  }
}


resource "google_compute_instance_group_manager" "default-terraform-staging" {
  name = "terraform-manager-staging"
  project = "comp698-lm2020"
  zone = "us-central1-f"
  base_instance_name = "staging"
  instance_template  = "${google_compute_instance_template.terraform-staging.self_link}"
  target_size = 1
}


resource "google_storage_bucket" "image-store" {
  project  = "comp698-lm2020"
  name     = "comp698-final"
  location = "us-central1"
}