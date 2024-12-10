terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.0.0"
}

# creating a docker network to allow communication between nginx docker and app docker 

provider "docker" {}

resource "docker_network" "app_network" {
  name = "app-network"
}

# build nginx docker image 

resource "docker_image" "nginx_image" {
  name = "nginx:alpine"
}

# build docker image for app 

resource "docker_image" "app_image" {
  name = "python:3.9-slim"
  build {
    context    = "./"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx_image.image_id
  ports {
    internal = 80
    external = 8081
  }
  ports {
    internal = 443
    external = 8443
  }
  volumes {
    host_path      = "/etc/nginx/certs"
    container_path = "/etc/nginx/certs"
  }
  volumes {
    host_path      = "./nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
  }
  networks_advanced {
    name    = docker_network.app_network.name
    alias   = "nginx"
  }
  depends_on = [docker_image.nginx_image]
}

resource "docker_container" "app_container" {
  name  = "app-container"
  image = docker_image.app_image.image_id
  ports {
    internal = 8080
    external = 8080
  }
  networks_advanced {
    name    = docker_network.app_network.name
    alias   = "app"
  }
  depends_on = [docker_image.app_image]
}

# redirects aragorn.local DNS name to local IP address 

resource "local_file" "hosts_file" {
  content = <<EOT
127.0.0.1 aragorn.local
EOT
  filename = "/etc/hosts"
}

# print the nginx IP address 

output "nginx_ip" {
  value = docker_container.nginx_container.ip_address
}
