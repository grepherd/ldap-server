#!/bin/bash

docker build -t ldap-server .
docker run -td -p 389:389 ldap-server