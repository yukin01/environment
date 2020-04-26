FROM ubuntu:focal

RUN apt-get update && apt-get -y install git curl

ENV USER ubuntu
ENV HOME /home/ubuntu
ENV SHELL /bin/bash

RUN addgroup --gid 1000 ubuntu && \
    adduser --uid 1000 --ingroup ubuntu --home /home/ubuntu --disabled-password --gecos "" ubuntu

WORKDIR /home/ubuntu
USER ubuntu:ubuntu
