function docker_install(){
    sudo apt update -y && sudo apt install -y docker-compose 
}

function docker_build(){
$ docker run --name docker-nginx -p 80:80 -v ./content:/usr/share/nginx/html:ro -d nginx
}

