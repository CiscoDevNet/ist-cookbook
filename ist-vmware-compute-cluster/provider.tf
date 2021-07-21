terraform {
  backend "remote" {
    organization = "rm-lab"

    workspaces {
      name = "sg_rmlab_01"
    }
  }
}

provider "vsphere" {
  user                  = var.vsphere_user
  password              = var.vsphere_password
  vsphere_server        = var.vsphere_server
  allow_unverified_ssl  = true
}