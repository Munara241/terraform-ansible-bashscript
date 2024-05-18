# Project 3 

# You need to have 3 things in 1 place:

``` hcl

Bash script file
Terraform folder with all needed files inside
Ansible folder with all needed files inside (In your Ansible folder create roles for Prometheus and Grafana)
Bash script should install Terraform and Ansible binaries on your jumphost(bastion), then it should create with Terraform VPC and EC2 Ubuntu Instance that will be used as a remote machine for Ansible. After Instance is created it should get its public IP and paste in hosts file for Ansible.
You SHOULDN'T be running terraform apply or ansible-playbook commands manually. You just need to execute Bash script and it should do all work with Terraform Instance creation and deploying with Ansible Prometheus and Grafana.

# create terraform.tfvar file and provide ec2 instance parameters
region        = "<region>"
instance_type = "<type>"
ec2_name = "<instance_name>"
```