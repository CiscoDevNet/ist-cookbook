output server_ip {
    value = vsphere_virtual_machine.server.*.default_ip_address
}
output server_name {
    value = vsphere_virtual_machine.server.*.name
}