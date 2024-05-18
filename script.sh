#!/bin/bash

# Install Terraform
sudo wget https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip
sudo unzip -o /home/ec2-user/terraform-ansible-bashscript/terraform_1.8.3_linux_amd64.zip
sudo mv /home/ec2-user/terraform-ansible-bashscript/terraform /usr/local/bin/
sudo rm -rf terraform_1.8.3_linux_amd64.zip
sudo terraform version

# Install Ansible
sudo yum install ansible -y
sudo ansible --version



