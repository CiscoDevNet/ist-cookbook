terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.25.2"
    }
  }
}

provider "tfe" {
  # Configuration options
  token = var.tf_orgtoken
}