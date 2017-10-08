## This is a test project. 
# When it is executed automatically launces AWS instances and installs and configures NGINX serving 1 static website.
# Ansible is used for the automation of the whole process. 


# Requirements: 
# To run you need an environemt with python, ansible, boto/boto3 installed. 


# Prepare environment: 

sudo apt-get install -y \
	python \
	python-pip \ 
        ansible

sudo pip install boto
sudo pip install boto3


# To allow programmatic access to your AWS accounts you need to create an IAM user and use the access keys. This is done in AWS.

cd ~ && \
mkdir .aws && \
touch credentials
	
#Credentials file should look like:

#[default]
#aws_access_key_id = AK****IAIG4WRE7DG***********
#aws_secret_access_key = MW****UuL****d2LqMJFH6*******************


# You also need to allow access to AWS API for the following PolicyGroup. You can do by adding the to the group of your IAM user.
# AmazonEC2FullAccess
# AmazonElasticCacheFullAccess

# Finally you need to provide ssh-keys in order to login to EC2 instances.
#
ssh-keygen -t rsa -b 2048
eval $(ssh-agent -s) 
ssh-add ~/.ssh/id_rsa

