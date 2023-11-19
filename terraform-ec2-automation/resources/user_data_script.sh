#!/bin/bash

sudo yum update -y

# installing java 17
# ref: https://cloudkatha.com/how-to-install-java-8-11-17-on-amazon-linux-2023-instance/
sudo yum install java-17-amazon-corretto -y

# upgrading to python 3.8
# ref: https://repost.aws/questions/QUtA3qNBaLSvWPfD5kFwI0_w/python-3-10-on-ec2-running-amazon-linux-2-and-the-openssl-upgrade-requirement
sudo yum remove python3 -y
amazon-linux-extras | grep python
sudo amazon-linux-extras install python3.8 -y
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python3.8 /usr/bin/python

# installing jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
echo "Jenkins Password"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "Jenkins Port"
cat /usr/lib/systemd/system/jenkins.service | grep JENKINS_PORT
