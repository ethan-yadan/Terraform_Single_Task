function docker_install(){

    sudo apt update -y && sudo apt install -y docker-compose 
}


function terraform_install(){

    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    # fix faye ==> ''' sudo vi /etc/apt/sources.list.d/hashicorp.list ''' (change faye to bookworm, if you work with linux mint) ( ubuntu, change to jammy)
    sudo apt update && sudo apt install terraform   
}




