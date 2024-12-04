# generating a SSL certificate 

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt

sudo mkdir /etc/nginx/certs

sudo cp nginx.crt /etc/nginx/certs/
sudo cp nginx.key /etc/nginx/certs/

sudo chown nginx:nginx /etc/nginx/certs/nginx.crt
sudo chown nginx:nginx /etc/nginx/certs/nginx.key
sudo chmod 644 /etc/nginx/certs/nginx.crt
sudo chmod 600 /etc/nginx/certs/nginx.key