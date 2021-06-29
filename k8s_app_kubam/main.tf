terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  # config_path = var.config_path
  host                   = var.host
  client_certificate     = base64decode(var.client_cert)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_cert)
}

resource "kubernetes_persistent_volume_claim" "kubam" {
  metadata {
    name = "kubam-pvc"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "7Gi"
      }
    }
  }
}

resource "kubernetes_deployment" "kubam_web" {
  metadata {
    name = "web"
  }
  spec {
    selector {
      match_labels = {
        app = "web"
      }
    }
    replicas = 1
    template {
      metadata {
        labels = {
          app = "web"
        }
      }
      spec {
        container {
          name  = "web"
          image = "kubam/web:v2"
        }
      }
    }
  }
}

resource "kubernetes_deployment" "kubam_api" {
  metadata {
    name = "kubam"
  }
  spec {
    selector {
      match_labels = {
        app = "kubam"
      }
    }
    replicas = 1
    template {
      metadata {
        labels = {
          app = "kubam"
        }
      }
      spec {
        container {
          name  = "kubam"
          image = "kubam/kubam:v2"
          volume_mount {
            name       = "kubam-pvc"
            mount_path = "/kubam"
          }
        }
        volume {
          name = "kubam-pvc"
        }
      }
    }
  }
}

resource "kubernetes_service" "kubam_web" {
  metadata {
    name = "kubam-web"
  }
  spec {
    selector = {
      app = kubernetes_deployment.kubam_web.spec.0.template.0.metadata.0.labels.app
    }
    port {
      name = "http"
      port = 80
    }
    type = "NodePort"
  }
}

resource "kubernetes_service" "kubam_api" {
  metadata {
    name = "kubam-api"
  }
  spec {
    selector = {
      app = kubernetes_deployment.kubam_api.spec.0.template.0.metadata.0.labels.app
    }
    port {
      name = "http"
      port = 80
    }
    type = "NodePort"
  }
}

resource "kubernetes_ingress" "kubam" {
  metadata {
    name = "tf-ingress"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = "kubam-web.intersightdemo.cisco.com"
      http {
        path {
          path = "/"
          # pathType = "Prefix"
          backend {
            service_name = kubernetes_service.kubam_web.metadata[0].name
            service_port = 80
          }
        }
      }
    }
    rule {
      host = "kubam-api.intersightdemo.cisco.com"
      http {
        path {
          path = "/"
          # pathType = "Prefix"
          backend {
            service_name = kubernetes_service.kubam_api.metadata[0].name
            service_port = 80
          }
        }
      }
    }
  }
}
