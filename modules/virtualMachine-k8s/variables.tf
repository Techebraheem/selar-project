

# Below are the required variables for my TF script, which will be referenced on my main.tf file

# This is a variable for my docker image
variable "image_name" {
  description = "Docker image name and tag for my python app" 
  type        = string
  default     = "python-app:latest" 
}

# This is a variable for my application’s port
variable "container_port" {
  description = "The port the application listens on inside the container"
  type        = number
  default     = 8080
}

# This is a variable specifying the number of replica counts of states for my deployment
variable "replica_count" {
  description = "Number of desired replicas"
  type        = number
  default     = 1
}
