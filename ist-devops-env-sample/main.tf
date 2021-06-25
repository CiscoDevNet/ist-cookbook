/*
resource "tfe_variable" "vsphere" {
  for_each = var.vars_vsphere
    key           = each.value.name
    value         = each.value.val
    sensitive     = each.value.sensitive
    hcl           = each.value.hcl
    category      = "terraform"
    workspace_id  = tfe_workspace.myworkspace.id
}
*/

module "loadbalancers" {
  source          = "./server"
  count           = var.vms["loadbalancer"].quantity
  template        = var.vms["loadbalancer"]
  server_name     = "${ var.vms["loadbalancer"].vmname}-sg-${count.index}"
  common_vm_specs = var.common_vm_specs
}

module "frontend" {
  source          = "./server"
  count           = var.vms["frontend"].quantity
  template        = var.vms["frontend"]
  server_name     = "${ var.vms["frontend"].vmname}-sg-${count.index}"
  common_vm_specs = var.common_vm_specs
}

module "backend" {
  source          = "./server"
  count           = var.vms["backend"].quantity
  template        = var.vms["backend"]
  server_name     = "${ var.vms["backend"].vmname}-sg-${count.index}"
  common_vm_specs = var.common_vm_specs
}