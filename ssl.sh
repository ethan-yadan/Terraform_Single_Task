function generate_ssl(){

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt

}

function create_cert_dir(){

    sudo mkdir /etc/nginx/certs

}

function copy_cert_key(){

    sudo cp nginx.crt /etc/nginx/certs/
    sudo cp nginx.key /etc/nginx/certs/

}

function permissions(){

    sudo chown nginx:nginx /etc/nginx/certs/nginx.crt
    sudo chown nginx:nginx /etc/nginx/certs/nginx.key
    sudo chmod 644 /etc/nginx/certs/nginx.crt
    sudo chmod 600 /etc/nginx/certs/nginx.key
    
}
