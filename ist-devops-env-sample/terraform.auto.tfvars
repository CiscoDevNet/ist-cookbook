vms = {
  frontend = {
    quantity   = 1
    vCPU        = 2
    vMEM        = 4096
    diskSize    = 60 # Will override the spec of the template
    vmname      = "frontend"
    datastore   = "JOHNNY01_DATASTORE01"
    network     = null # Will be used the one in the common_vm_specs
    hostname    = "frontend"
    domain_name = "rmlab.local"
  }
  backend = {
    quantity   = 2
    vCPU        = 4
    vMEM        = 8192
    diskSize    = null
    vmname      = "backend"
    datastore   = "JOHNNY01_DATASTORE01"
    network     = null
    hostname    = "backend"
    domain_name = "rmlab.local"
  }
  loadbalancer = {
    quantity   = 3
    vCPU        = 2
    vMEM        = 4096
    diskSize    = 60
    vmname      = "loadbalancer"
    datastore   = "JOHNNY01_DATASTORE01"
    network     = "192.168.130"
    hostname    = "loadbalancer"
    domain_name = "rmlab.local"
  }
}