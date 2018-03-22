FROM jenkins/jenkins:lts

LABEL author.name="Carlos Garcia-Berro Molero" \
      author.username="gbmcarlos" \
      author.email="gbmcarlos@gmail.com"

# If we want to install via apt
# Also to avoid the permission issue of /var/jenkins_home/copy_reference_file.log
USER root

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
