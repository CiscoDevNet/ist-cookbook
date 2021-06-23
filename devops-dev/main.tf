module "loadbalancers" {
  source          = "./server"
  count           = var.vms["loadbalancer"].instances
  template        = var.vms["loadbalancer"]
  server_name     = "${ var.vms["loadbalancer"].vmname}${count.index}"
  common_vm_specs = var.common_vm_specs
}

module "frontend" {
  source          = "./server"
  count           = var.vms["loadbalancer"].instances
  template        = var.vms["frontend"]
  server_name     = "${ var.vms["frontend"].vmname}${count.index}"
  common_vm_specs = var.common_vm_specs
}

module "backend" {
  source          = "./server"
  count           = var.vms["loadbalancer"].instances
  template        = var.vms["backend"]
  server_name     = "${ var.vms["backend"].vmname}${count.index}"
  common_vm_specs = var.common_vm_specs
}