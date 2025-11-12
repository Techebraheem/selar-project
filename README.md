Local Deployment Parity Objective

This document summarizes the steps taken to achieve the local deployment parity objective, using Minikube and Terraform to deploy a sample Python application.


1. Application Overview

The application deployed is a simple Python Flask API located in the /home/ibrahim/Desktop/selar-co_Ibrahim-Isyaka/python-app

* Image Name: python-app:latest
* Container Port: 8080
* Key Endpoint: /health 

2. Local Environment Requirements

Before deployment, ensure the following tools are installed and operational:

* Docker: Used to build the application image.
* Minikube: Used to run the local Kubernetes cluster.
* kubectl: Used to interact with the cluster.
* Terraform: Used to define and deploy the infrastructure and application resources.

3. Build and Setup Instructions

A. Build and Load the Docker Image

1. Navigate to the application source directory:  cd home/ibrahim/Desktop/selar-co_Ibrahim-Isyaka/python-app
2. Build the Docker image:  docker build -t python-app:latest . 
3. Start Minikube (using the Docker driver):  minikube start --driver=docker
4. Load the local image into the Minikube runtime:  minikube image load python-app:latest

B. Deploy with Terraform

The Kubernetes deployment manifests (Deployment, Service) are defined within the modules/virtualMachine-k8s module and called by the infra/local-deployment.tf configuration.

1. Navigate to the Terraform configuration directory:  cd infra
2. Initialize Terraform :  terraform init 
3. Apply the configuration which deploys the Python app and NodePort Service to Minikube:  terraform apply --auto-approve 

4. Verification and Access

Once terraform apply is complete, verify the deployment and access the application.

1. Check Resources:  kubectl get deployments,services,pods 
2. Access URL: Retrieve the host-accessible URL for the application service:  minikube service python-app-service --url  This command will output the URL (e.g., http://192.168.49.2:30123).

