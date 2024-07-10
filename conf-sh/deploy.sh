#!/bin/bash

echo 'Hello World'

x1="${1}.conf"
x2="${1}"
s_name="app.site.com.conf"
s_url="app.site.com"
file_path="/etc/nginx/sites-enabled/"

echo "x1: $x1"
echo "x2: $x2"
echo "s_name: $s_name"
echo "s_url: $s_url"
echo "file_path: $file_path"

# Copy the file with the name x
cd $file_path
sudo cp $s_name $x1

# Edit the text inside the file
sudo sed -i "s/$s_url/$x2/g" "$x1"

sudo nginx -t

sudo systemctl restart nginx
sudo systemctl status nginx

# Save the changes
echo "Changes applied successfully."
