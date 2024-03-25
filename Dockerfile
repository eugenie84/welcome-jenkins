# Base image
FROM centos:7

# Description
LABEL Description="Dockerfile to contenerize an apache app"

# Update all package
RUN yum update -y

# Install apache on the container
RUN yum install -y httpd

# Copy the application + dependencies inside the container
COPY ./music/ /var/www/html

# Port on which the container should listen on
EXPOSE 80

#systemctl start httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# Run the container in background
CMD [ "-D", "FOREGROUND" ]
