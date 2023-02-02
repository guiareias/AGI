#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y upgrade

# install tools for managing ppa repositories
sudo apt-get -y install software-properties-common
sudo apt-get -y install unzip
sudo apt-get -y install build-essential
# 
sudo apt-get -y install libssl-dev 
sudo apt-get -y install libffi-dev 
# required for Openstack SDK
sudo apt-get -y install python3-dev 
sudo apt-get -y install python3-pip

# Add graph builder tool for Terraform
sudo apt-get -y install graphviz

# install Ansible (http://docs.ansible.com/intro_installation.html)
sudo apt-add-repository -y -u ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible

# Install Terraform
sudo apt-get update
# install GNU Privacy Guard
sudo apt-get install -y gnupg
# add HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com/ $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get -y install terraform

# install OpenStack SDK modules
pip install python-openstackclient

# Install Google Cloud SDK
snap install google-cloud-sdk --classic

# Install Kubernetes Controller
sudo snap install kubectl --classic

# Install Amazon AWS-CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install docker
curl -fsSL https://get.docker.com/ -o get-docker.sh
sudo sh get-docker.sh

# Give docker admin priviledges
sudo groupadd docker
sudo usermod -aG docker ${USER}

# Install JRE and JDK
sudo apt-get -y install openjdk-11-jre
sudo apt-get -y install openjdk-11-jdk

# Configure JAVA_HOME variable
sudo export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"

# Install Apache Maven
sudo apt-get -y install maven

# Clean up cached packages
sudo apt-get clean all
sudo rm ./awscliv2.zip