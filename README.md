According to [Jenkins Docker image documentation](https://github.com/jenkinsci/docker/blob/master/README.md#installing-more-tools) you need to extend their Dockerfile to add more tools.
# Instructions
Run the container:
`docker run --name jenkins -d -p 80:8080 -p 50000:50000 -v ~/jenkins_home:/var/jenkins_home gbmcarlos/custom-jenkins-docker`

Extract the initial admin password:
`docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`

Copy the SSH key from the host to the container:
`docker cp ~/ssh_key.pem jenkins:/var/jenkins_home/.ssh/`
