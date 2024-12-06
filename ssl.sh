#!/bin/bash 

# Generating SSL Certificate 
function generate_ssl(){
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt
    if [ $? -ne 0 ]; then 
        echo "SSL certificate generation failed"
        exit 1
    fi 
        echo "SSL certificate generated successfully"
}

# Creating Certs Directory 
function create_cert_dir(){
    if [ ! -d "~/etc/nginx/certs" ]; then 
        sudo mkdir /etc/nginx/certs
        echo "Directory ~/etc/nginx/certs created"
    else 
        echo "Directory ~/etc/nginx/certs already created"
    fi 
}

# Copy Certificate and Key files to Certs Directory 
function copy_cert_key(){
    if [ -f "nginx.crt" ] && [ -f "nginx.key" ]; then 
        sudo cp nginx.crt ~/etc/nginx/certs/
        sudo cp nginx.key ~/etc/nginx/certs/
        echo "Certificate and Key copied to /etc/nginx/certs"
    else 
        echo "SSL certificate or key files do not exists" 
        exit 1
    fi 
}

# Setting permissions to certificate and key files 
function permissions(){

    sudo chown nginx:nginx ~/etc/nginx/certs/nginx.crt
    sudo chown nginx:nginx ~/etc/nginx/certs/nginx.key
    sudo chmod 644 ~/etc/nginx/certs/nginx.crt
    sudo chmod 600 ~/etc/nginx/certs/nginx.key
    echo "Permissions set for certificate and key"
}

# call functions 
generate_ssl 
create_cert_dir
copy_cert_key
permissions

