FROM ubuntu:14.04

MAINTAINER Luis Elizondo <lelizondo@gmail.com>

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get -y install ansible openssh-server git curl python && \
    curl -L https://github.com/digitalocean/doctl/releases/download/v1.1.0/doctl-1.1.0-linux-amd64.tar.gz  | tar xz && \
    mv ./doctl /usr/local/bin

RUN ( echo ubuntu ; echo ubuntu ) | passwd root
RUN sed -i 's/PermitRootLogin .*/PermitRootLogin yes/g' /etc/ssh/sshd_config

COPY ansible /opt/ansible
COPY run-ansible /opt/run-ansible
COPY providers /opt/providers
