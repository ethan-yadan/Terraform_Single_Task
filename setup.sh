function terraform_install(){

    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform   
}

function docker_install(){
    sudo apt update -y && sudo apt install -y docker-compose 
}

function docker_build(){
$ docker run --name docker-nginx -p 80:80 -v ./content:/usr/share/nginx/html:ro -d nginx
}

