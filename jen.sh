
#!/bin/bash

yum install docker -y

sudo yum update -y
sudo dnf update -y
sudo yum install java-21-amazon-corretto -y # For AL2
sudo dnf install java-21-amazon-corretto -y # For AL2023
sudo wget -O /etc/yum.repos.d/jenkins.repo \
   https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum install jenkins -y # AL2
sudo dnf install jenkins -y # AL2023
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

#after installation give below

sudo mkdir -p /var/tmp_disk
sudo chmod 1777 /var/tmp_disk
sudo mount --bind /var/tmp_disk /tmp
echo '/var/tmp_disk /tmp none bind 0 0' | sudo tee -a /etc/fstab
sudo systemctl mask tmp.mount
df -h /tmp
sudo systemctl restart jenkins
sudo systemctl status Jenkins

yum install git -y

git -v
