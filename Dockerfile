FROM jenkins/jenkins:lts
# If we want to install via apt
USER root

# Install PHP7.0
RUN apt-get update && apt-get install -y \
  php7

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Drop back to the regular jenkins user - good practice
USER jenkins
