terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.15"
    }
  }
}
module "local_api_deployment" {
  source = "../modules/virtualMachine-k8s"
}
