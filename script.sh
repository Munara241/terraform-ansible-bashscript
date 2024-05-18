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

# Navigate to Terraform directory and initialize and apply configuration
sudo cd home/ec2-user/terraform-ansible-bashscript/Terraform
sudo terraform init
sudo terraform apply -auto-approve

# Retrieve the public IP address of the EC2 instance
EC2_PUBLIC_IP=$(terraform output -raw ec2)

# Update the Ansible hosts file for Grafana
echo "[ec2-instance]" > /home/ec2-user/terraform-ansible-bashscript/Ansible/aws_grafana/hosts
echo "$EC2_PUBLIC_IP ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/home/ec2-user/.ssh/id_rsa" >> /home/ec2-user/terraform-ansible-bashscript/Ansible/aws_grafana/hosts

# Navigate to Ansible aws_grafana directory and run playbooks
cd /home/ec2-user/terraform-ansible-bashscript/Ansible/aws_grafana
ansible-playbook -i hosts grafana.yml

# Update the Ansible hosts file for Prometheus
echo "[ec2-instance]" > /home/ec2-user/terraform-ansible-bashscript/Ansible/aws_prometheus/hosts
echo "$EC2_PUBLIC_IP ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/home/ec2-user/.ssh/id_rsa" >> /home/ec2-user/terraform-ansible-bashscript/Ansible/aws_prometheus/hosts

# Navigate to Ansible aws_prometheus directory and run playbooks
cd /home/ec2-user/terraform-ansible-bashscript/Ansible/aws_prometheus
ansible-playbook -i hosts prometheus.yml


