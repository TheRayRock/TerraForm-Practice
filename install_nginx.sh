#!/bin/bash

sudo apt-get update

sudo apt-get install nginx -y

sudo systmctl start nginx 

sudo systemctl enable nginx 

echo "<h1> TerraForm In One short by Shahnawaz </h1>" | sudo tee /var/www/html/index.html