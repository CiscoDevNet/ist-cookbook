data "vsphere_datacenter" "dc" {
  name = var.dc_name
}

// Create a Cluster in the given DataCenter
resource "vsphere_compute_cluster" "my_cluster" {
  name                  = var.dc_cluster_name
  datacenter_id         = data.vsphere_datacenter.dc.id
  drs_enabled           = true
  drs_automation_level  = "partiallyAutomated"
  ha_enabled            = false
}

// Add host(s) in the VMware Inventory and assign to the previously created cluster
resource "vsphere_host" "hosts" {
  for_each = var.servers
    hostname      = each.value.hostname
    license       = each.value.license
    maintenance   = each.value.maintenance_mode
    thumbprint    = each.value.thumbprint
    username      = var.h_username
    password      = var.h_password
    cluster       = vsphere_compute_cluster.my_cluster.id

    depends_on = [vsphere_compute_cluster.my_cluster]
}
