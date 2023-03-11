#!/bin/bash

# Download Splunk Universal Forwarder installation package
wget -O splunkforwarder.tgz "https://download.splunk.com/products/universalforwarder/releases/9.0.4/linux/splunkforwarder-9.0.4-de405f4a7979-Linux-x86_64.tgz?_gl=1*110uvsm*_ga*MTMzMzkwOTA2MC4xNjc4MzIzOTE5*_ga_5EPM2P39FV*MTY3ODMzNTMwNy4yLjEuMTY3ODMzNTgwNC40Ny4wLjA."

# Extract the Splunk Universal Forwarder installation package
tar -xvf splunkforwarder.tgz
rm splunkforwarder.tgz

# Installation path is hard coded. If you would like to change this directory either manually change it within the code or use "read -p "something" variable" to customize installation path
INSTALL_DIR="/opt/splunkforwarder"

# Initializing and grabbing necessary info to automate installaion.
read -p "Enter the username for authentication: " username
read -s -p "Enter the password for authentication: " password
echo
read -p "Enter the splunk server's address: " server_address
read -p "Enter the splunk server's port: " server_port

# Move the Splunk Universal Forwarder installation to the specified directory
sudo mv splunkforwarder $INSTALL_DIR

# Move the splunkforwarder installation to the specified directory stored in "INSTALL_DIR" variable
cd /opt/splunkforwarder/bin/

# Run the Splunk Universal Forwarder installation script with the necessary parameters
./splunk start --accept-license --answer-yes --no-prompt --seed-passwd $password --gen-and-print-passwd

# Set the server to forward logs to
./splunk add forward-server $server_address:$server_port -auth admin:$username

# Automatically monitor log files stored in /var/log/
./splunk add monitor /var/log/

# Enabling splunk on boot
sudo ./splunk enable boot-start

# Restart to let new changed content to go through
./splunk restart

# Add the Splunk Universal Forwarder bin directory to the PATH environment variable
echo "export PATH=$INSTALL_DIR/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
