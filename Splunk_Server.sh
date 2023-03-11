#!/bin/bash

# Download the Splunk installation package
wget -O splunk.tgz "https://download.splunk.com/products/splunk/releases/9.0.4/linux/splunk-9.0.4-de405f4a7979-Linux-x86_64.tgz?_gl=1*1jbao2e*_ga*MTMzMzkwOTA2MC4xNjc4MzIzOTE5*_ga_5EPM2P39FV*MTY3ODMyMzkxOS4xLjEuMTY3ODMyNDAwMS41OC4wLjA."

# Extract the Splunk installation package
tar -xvf splunk.tgz
rm splunk.tgz

# Initializing and grabbing necessary info to automate installaion.
INSTALL_DIR="/opt/splunk"

read -s -p "Enter password for default admin account: " admin_pass
echo
read -p $"Enter the username you would like to use: " username
read -s -p "Enter the password you would like to use for $username: " password
echo
read -p $"Enter full name for second account: " full_name
read -p "what port would you like to assign to receiver port? " receive_port

# Move the Splunk installation to the specified directory stored in "INSTALL_DIR" variable
sudo mv splunk $INSTALL_DIR

# Navigating to splunk folder
cd /opt/splunk/bin/

# Run the Splunk installation script with the necessary parameters
./splunk start --accept-license --answer-yes --no-prompt --seed-passwd $admin_pass --gen-and-print-passwd

# Set the Splunk admin user and password
./splunk edit user admin -password $admin_pass -auth admin:$admin_pass

# Add a second user for logging in and using splunk with role being set to Power (Second Level Admin)
./splunk add user $username -role Power -password $password -full-name "$full_name"

# Automatically monitor log files stored in /var/log/
./splunk add monitor /var/log/

# Enabling receiving port for universal forwarders to use
./splunk enable listen $receive_port -auth admin:$admin_pass

# Enabling splunk on boot
sudo ./splunk enable boot-start

# Restart to let newly changed content to go through
./splunk restart

# Add the Splunk bin directory to the PATH environment variable
echo "export PATH=$INSTALL_DIR/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
