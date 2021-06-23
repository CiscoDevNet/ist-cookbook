
output "loadbalancer_ips" {
  value = flatten(module.loadbalancers.*.server_ip)
}
output "frontend_ips" {
  value = flatten(module.frontend.*.server_ip)
}
output "backend_ip" {
  value = flatten(module.backend.*.server_ip)
}