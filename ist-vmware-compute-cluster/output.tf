output "ClusterName" {
  value = vsphere_compute_cluster.my_cluster.name
}

output "ClusterID" {
    value = vsphere_compute_cluster.my_cluster.id
}

output "HostName" {
  value = {for h, v in vsphere_host.hosts: h => v.hostname}
}
