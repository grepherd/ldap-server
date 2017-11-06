#!/bin/bash

sudo docker build -t ldap-server .
sudo docker run -td -p 389:389 -p 80:80 ldap-server
