# Configure Docker provider
provider "docker" {
  # Update with your Docker daemon socket path if necessary
  host = var.docker_host
}

# Define variables (optional)
variable "docker_host" {
  type = string
  default = "unix:///var/run/docker.sock"
}

# Creating a Docker network for connecting the containers
resource "docker_network" "web_net" {
  name = "web_net"
}

# First container - Nginx configuration
resource "docker_container" "nginx" {
  name = "nginx"
  image = "nginx:latest"
  network_mode = "web_net"
  ports {
    internal = 80
    external = 443
  }

  # Mount SSL certificates volume (configuration to be added later)
  # mount {
  #   source = docker_volume.ssl_cert.name
  #   destination = "/etc/ssl/certs"
  #   read_only = true
  # }
  # Configure Nginx to forward traffic (configuration to be added later)
  # command = ["nginx", "-g", "daemon off;"]
}

# Second container - App configuration
resource "docker_container" "app" {
  name = "app"
  image = "alpine:latest"
  network_mode = "web_net"
  command = ["echo", "Hello World"]
  ports {
    internal = 8080
  }
}

# Optional: Local DNS entry for testing (modify as needed)
# resource "null_resource" "local_dns" {
#   name = "local_dns_entry"
#   provisioner "local-exec" {
#     command = "echo 127.0.0.1 daftpunk.com >> /etc/hosts"
#   }
# }

# Output the IP address of the Nginx container
output "nginx_ip" {
  value = docker_container.nginx.ip_address
}