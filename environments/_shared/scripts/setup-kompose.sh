#!/bin/bash

curl -L https://github.com/kubernetes/kompose/releases/download/v1.17.0/kompose-linux-amd64 -o kompose

chmod +x kompose

mv ./kompose /usr/local/bin/kompose