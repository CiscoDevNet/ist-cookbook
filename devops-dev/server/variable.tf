
variable "template" {
  type = map
}
variable "common_vm_specs" {
  type        = map(any)
  description = "Common VM specification and/or configuration"
}
variable "server_name" {
  type = string
  description = "The name of the server"
}