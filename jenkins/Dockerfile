FROM jenkins

COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

# Adding default Jenkins Jobs
COPY jobs /usr/share/jenkins/ref/jobs_temp
RUN ls /usr/share/jenkins/ref/jobs_temp | awk '{print $0}' | sed 's/\.[^\.]*$//' | awk '{ system("mkdir -p /usr/share/jenkins/ref/jobs/" $1) }'
RUN ls /usr/share/jenkins/ref/jobs_temp | awk '{print $0}' | sed 's/\.[^\.]*$//' | awk '{ system("cp /usr/share/jenkins/ref/jobs_temp/" $1 ".xml /usr/share/jenkins/ref/jobs/" $1 "/config.xml") }'

############################################
# Configure Jenkins
############################################
# Jenkins settings
COPY config/config.xml /usr/share/jenkins/ref/config.xml

# SSH Keys & Credentials
COPY config/credentials.xml /usr/share/jenkins/ref/credentials.xml
COPY config/ssh-keys/cd-demo /usr/share/jenkins/ref/.ssh/id_rsa
COPY config/ssh-keys/cd-demo.pub /usr/share/jenkins/ref/.ssh/id_rsa.pub

# Install PHP and Composer
USER root
RUN apt-get update && apt-get install -y php5 && rm -rf /var/lib/apt/lists/*
RUN php -r "readfile('https://getcomposer.org/installer');" | php
