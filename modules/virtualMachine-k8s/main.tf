

# Similar to the Kubernetes Deployment manifest config, below configurations specifies the desired state for the application
resource "kubernetes_deployment_v1" "python-app" {
  metadata {
    name = "python-app-deployment"
    labels = {
      app = "python-app"
    }
  }

  spec {
    replicas = var.replica_count
    selector {
      match_labels = {
        app = "python-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "python-app"
        }
      }
      spec {
        container {
          name  = "python-app"
          image = var.image_name
          image_pull_policy = "Never" 
          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}



# Similar to the service yml configurations, this exposes the Deployment internally
resource "kubernetes_service_v1" "python-app" {
  metadata {
    name = "python-app-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.python-app.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = var.container_port
    }
    type = "NodePort"
  }
}



# Output the service access details
output "service_name" {
  value = kubernetes_service_v1.python-app.metadata[0].name
}

output "service_url" {
  # This value provides the command needed to get the final Minikube URL
  value = "To get the URL, run: minikube service ${kubernetes_service_v1.python-app.metadata[0].name} --url"
}
