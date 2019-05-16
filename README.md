Wordpress project - Cloud Architecture


1) ANSIBLE PART

Ansible file: main.yml

The command used to execute main.yml is :

ansible-playbook main.yml

The variables are now in /vars/main.yml

To connect to the wordpress server, use : http://51.15.89.164

This command install WordPress into my target host:
$ ansible-playbook playbook.yml -i hosts -u root -K


2) TERRAFORM PART

Terraform file: main.tf variables.tf

create variables.tfvars, and put the name of your variables inside:

scw_token="x"

organization="x"

Run:

terraform init

then terraform plan -var-file="variables.tfvars"

then terraform apply -var-file="variables.tfvars"

3) PACKER PART

Packer file: scaleway-template.json

my config:

In the .bashrc file write : export SCW_TOKEN=<your_token> and export SCALEWAY_ORGANIZATION=<your_organization_id>

Run packer build scaleway-template.json
