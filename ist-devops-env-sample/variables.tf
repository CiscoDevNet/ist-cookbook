

// The vsphere ip address
variable "vsphere_server" {
  description = "VMware vSphere IP address"
  type        = string
}

// The vsphere user
variable "vsphere_username" {
  description = "VMware vSphere User Password"
  type        = string
}

// The vsphere password
variable "vsphere_password" {
  description = "VMware vSphere User Password"
  type        = string
}

variable "common_vm_specs" {
  type        = map(any)
  description = "Common VM specification and/or configuration"
}

variable "vms" {
  type = map(object({
    quantity    = number
    vCPU        = number
    vMEM        = number
    diskSize    = number
    vmname      = string
    datastore   = string
    network     = string
    hostname    = string
    domain_name = string
  }))
}