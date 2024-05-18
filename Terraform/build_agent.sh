#! /usr/bin/bash

# sudo yum update –y
# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
# sudo yum upgrade -y
# sudo amazon-linux-extras install java-openjdk11 -y
# sudo yum install jenkins -y
# sudo systemctl enable jenkins
# sudo systemctl start jenkins
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword

 sudo yum update –y
 sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
 sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
#Install Docker



#Start the Docker service.
sudo amazon-linux-extras install docker
sudo yum install -y docker
sudo service docker start

#Add user to Docker group
# sudo usermod -a -G docker ec2-user

sudo docker ps


 sudo yum install jenkins -y
#Start Jenkins Server
sudo systemctl enable jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo systemctl start jenkins
sudo systemctl status jenkins


