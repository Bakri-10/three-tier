#!/bin/bash

# Update the system and install necessary packages
sudo yum update -y
sudo yum install -y httpd php

# Start the Apache web server
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a basic HTML file for your demo app
echo "<html>
  <head>
    <title>My Demo Web App</title>
  </head>
  <body>
    <h1>Welcome to My Demo Web App!</h1>
    <p>This is a simple web application running on an EC2 instance.</p>
  </body>
</html>" | sudo tee /var/www/html/index.html

# Open port 80 in the firewall (HTTP)
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# Print the public IP address of the EC2 instance
#echo "Public IP Address: $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"

# You can add more configuration or application setup steps here
