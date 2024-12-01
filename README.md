![Terraform Arch](Terraform.jpg)

# Terraform Single File Docker Task 

This task requires to create terraform project file that will start multi container environment with nginx as loadbalancer 
and ssl configuration to be implemented.

- Create 2 contatiners:
    - nginx with https to forward to other container
    - app container to answer with `hello world` back to the requester

- Create terraform file `main.tf`:
    - run above mentioned containers
    - verify that there is dns redirection with /etc/hosts to some fake dns name (use your imagination)
    - print out the ip address of nginx container

![Nginx](nginx_logo.png) ![Docker](docker_logo.png)

## Table Of Contents

- [Prerequisites](#prerequisites)
- [Links](#links) 
- [Usage](#usage)
- [Script](#script)
- [Installation](#installation)
- [Contributing](#contributing)

## Prerequisites

- Linux Debian distribution
- Python 3.5 or later (python ≥ 3.6 is recommended) and pip are installed
- Docker environment installed (docker-compose)
- Terraform environment installed
- Ensure firewall allows outbound traffic to necessary endpoints 

## Installation
