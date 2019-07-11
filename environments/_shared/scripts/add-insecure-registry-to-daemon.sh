#!/bin/bash

mkdir -p /etc/docker
printf '{ "insecure-registries":["my-registry:5000"] }' > /etc/docker/daemon.json

systemctl daemon-reload
systemctl restart docker