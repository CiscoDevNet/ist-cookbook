data "vsphere_datacenter" "dc" {
  name = var.common_vm_specs["vc_datacenter"]
}

data "vsphere_datastore" "datastore" {
  name          = var.common_vm_specs["vc_datastore"]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = var.common_vm_specs["vc_cluster"]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.common_vm_specs["vc_network"]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.common_vm_specs["vm_template_path"]
  datacenter_id = data.vsphere_datacenter.dc.id
}


resource "vsphere_virtual_machine" "server" {

  name     = var.server_name
  num_cpus = var.template["vCPU"]
  memory   = var.template["vMEM"]

  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  folder    = var.common_vm_specs["vm_folder"]

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = var.common_vm_specs["vm_adaptor_type"] 
  }

  wait_for_guest_net_timeout = 0

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = var.server_name
        domain    = var.template["domain_name"]
      }
      network_interface {}
    }
  }
}