variable "config_path" {
  type        = string
  description = "k8s provider config path"
  default     = null
}

variable "host" {
  type        = string
  description = "k8s provider host"
  default     = "https://172.22.248.220:6443"
}

variable "client_cert" {
  type        = string
  description = "k8s provider client certificate"
  default     = null
}

variable "client_key" {
  type        = string
  description = "k8s provider client key"
  default     = null
}

variable "cluster_ca_cert" {
  type        = string
  description = "k8s provider cluster ca certificate"
  default     = null
}

