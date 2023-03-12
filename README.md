# Splunk-Environment-Setup

The goal of this project is to semi-automate the installation of a Splunk server and configure Splunk universal forwarders to send necessary data to the Splunk server. This project is used as a supplementary portion of upcoming projects and is intended to configure Splunk server and universal forwarders in a timely and efficient manner.

# Splunk 

Splunk is a software platform for searching and analyzing machine-generated data through visualization or hard-coded information. Another important aspect of Splunk is centralized logging, which allows administrators to forward logs from many devices into a central log server. It uses lightweight agents and forwarders, which can be either deployed as containers or installed directly on the source machine, to send data to one or more indexers. It's worth noting that Splunk could be configured either on the cloud or on-premise; however, for the sake of simplicity in this project, it will be installed directly on virtual machines to somewhat emulate a basic demo. This project aims to utilize the centralized logging aspect of Splunk and is intended to configure and initialize Splunk to be used further.

With that being said, data visualization and other features of Splunk will not be showcased in this project. However, as stated above, this project is a supplementary portion of upcoming projects, meaning the visualization of data and other features of Splunk will be demoed for future projects.

Finally, Splunk offers many add-ons and apps for different use cases such as IT operations, DevOps, cloud monitoring, and more.

# Disclaimer

I have made simple bash scripts that automatically put in the commands necessary for configuring Splunk Server and Universal Forwarder. The codes have been tested and are functional. A couple things are worth mentioning if you would like to replicate this repository:
  -  The codes provided are mostly intended for server-to-forwarder exchange. If you would like more customization, feel free to use while loops and if-else statements to get rid of the hardcoded receiving port configuration.
  -  A sha512sum hash has been provided in the repository, which you could use to make sure that the integrity of these files is intact. Any changes to this file could be detected by different hash values.
  -  If you change the source code (delete, add, or modify) and it results in breaking your system, I should not be held liable for the damage. So use at your own discretion.
 
# Getting started

## Prerquisites

- Unix based OS
  - In this project, Ubuntu Server and Ubuntu Desktop has been used
- Git

## Git Installation

Download the git installer from [Git](https://git-scm.com/downloads) follow the installation steps to install git on your device. If you are using linux, use the following inside terminal:
```
git --version 
```
If the output shows git with a version, then skip the Git installation section as you already have git installed.

If git was not installed, do the following:
```
sudo apt-get update; sudo apt-get install git -y
```
or if you are using an Arch-based distro:
```
sudo pacman -Sy git
```

## Cloning this repository

Use the following command to clone this repository
```
git clone https://github.com/kasra-sal/File-Integrity-Monitor.git
```
## Preparing Scripts

Once you cloned this repository, make sure you run the following command to make it executable:
```
chmod +x "name_of_script" i.e., chmod +x Splunk_Server.sh
```
## Information Regarding the Scripts
  
 - Both source codes contain a link for downloading. If you are using this repository to configure Splunk, make sure that the link provided in the script is replaced with a newer and more stable one.
 - The code is commented in an easy-to-read manner. If you do not understand a section of the code, feel free to reach out or use Google.
 - If you notice splunk.tgz or splunkforwarder.tgz appearing and disappearing on your screen, it is intended, and that is because, for the sake of saving time cleaning up the download and extraction, it will automatically extract tarballs and remove tarball files.
 - During installation for individual devices, you might get a pop-up for a sudo password. This is okay, as splunk files will be moved to the /opt/ directory, and some codes use the "sudo" command.
  
  
# Demo

## Splunk Server Configuration

https://user-images.githubusercontent.com/118489496/224566222-d3a990ab-69a9-4934-b297-865a37317901.mp4

## Splunk Forwarder Configuration

https://user-images.githubusercontent.com/118489496/224566297-734d3046-b4fb-4815-a6e5-d02c60758a49.mp4

## Splunk First Login

https://user-images.githubusercontent.com/118489496/224566311-f905ff3c-2c1e-414f-8fc8-c922f25dbdc3.mp4








