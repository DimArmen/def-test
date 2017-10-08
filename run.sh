#!/bin/bash

set -x

# build AWS infra
ansible-playbook -i inventory/localhost \
	aws_setup/aws_security_group_create.yml \
	aws_setup/aws_vm_provision_sample.yml

#give AWS machines time to initialize
sleep 120

# refresh EC2 inventory
python inventory/ec2.py

# check if macines are ready
ansible -i inventory/ec2.py -u ubuntu "tag_Name_definiens" -m ping
echo $?

# configure machines
ansible-playbook -u ubuntu --become -i inventory/ec2.py sites/vm_sample.yml
