FROM ubuntu:14.04

MAINTAINER Luis Elizondo <lelizondo@gmail.com>

COPY ansible /opt/ansible
COPY run-ansible /opt/run-ansible

RUN apt-get install openssh-server git curl python 
