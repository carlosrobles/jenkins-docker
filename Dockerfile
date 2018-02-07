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
  github-api:1.90 \
  scm-sync-configuration:0.0.10 \
  github:1.29.0

# Drop back to the regular jenkins user - good practice
USER jenkins
