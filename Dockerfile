FROM python:3.11

RUN apt update && apt install -y nano sshpass && pip install ansible

WORKDIR /ansible
