FROM jenkins/jenkins:lts
# If we want to install via apt
USER root

# Install PHP7.0
RUN apt-get update && apt-get install -y \
  php7.0

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install plugins
RUN /usr/local/bin/install-plugins.sh \
  github:1.29.0 \
  scm-sync-configuration:0.0.10
  
# Configure SSH client
RUN echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config
RUN echo '\n\
Host *\n\
  IdentityFile /var/jenkins_home/.ssh/carlos-key-pair-useast2.pem\n'\
>> /etc/ssh/ssh_config

# Drop back to the regular jenkins user - good practice
USER jenkins
