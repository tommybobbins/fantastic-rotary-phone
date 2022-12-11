// Configure the Google Cloud provider

variable "region" {
  description = "Google Cloud region"
  default     = "europe-west2"
}

variable "project" {
  description = "Google Cloud Project Name"
  default     = "my-project-name"
}

variable "credentials_file" {
  description = "Google Cloud Credentials json file"
  default     = "credentials.json"
}

variable "user" {
  description = "The username to create on the remote server"
  default     = "tng"
}
<<<<<<< HEAD

locals {
  region_user_project = "${var.region}-${var.user}-${var.project}"
}
=======
>>>>>>> parent of f431416 (Added test locals for PoC)
