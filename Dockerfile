FROM jenkins/jenkins:lts
# If we want to install via apt
# Also to avoid the permission issue of /var/jenkins_home/copy_reference_file.log
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
RUN echo '\n \
StrictHostKeyChecking no \n \ 
Host * \n \
  IdentityFile /var/jenkins_home/.ssh/ssh_key.pem\n' \
>> /etc/ssh/ssh_config
