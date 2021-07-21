
/*
  A map of host(s9 that will be added to the VMWare inventory and then assigned to a new cluster.
  Sample Map looks like:
  servers = {
  runDMZ = {
    hostname            = "192.168.X.X"
    license             = "LICENSE_KEY_HER"
    thumbprint          = "AA:BB:CC:CC:DD:EE:A1:A2:A3:A4:B1:B2:B3:B4:12:34:56:1D:1E:EE"
    maintenance_mode    = true
  }
}
*/

variable "servers" {
  type = map(object({
    hostname = string
    license = string
    thumbprint = string
    maintenance_mode = bool
  }))
}


// The name of the new Compute Cluster
variable "dc_cluster_name" {
  type = string
}

// The SSH username used by vSphere to authenticate to the host
variable "h_username" {
  type = string
} 

// The SSH password associated to the user used by vSphere to authenticate to the host
variable "h_password" {
  type = string
  sensitive = true
} 

// The name of the DataCenter
variable "dc_name" {
  description = "Name of the DataCenter"
  type        = string
}

// The IP/FQDN of the vSphere Server
variable "vsphere_server" {
  description = "VMware vSphere IP address"
  type        = string
}

// The username used to access vSphere
variable "vsphere_user" {
  description = "VMware vSphere User Password"
  type        = string
}

// The password associated to the user to access vSphere
variable "vsphere_password" {
  description = "VMware vSphere User Password"
  type        = string
}