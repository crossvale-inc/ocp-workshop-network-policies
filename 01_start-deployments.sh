#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Kustomize Deployment of the Projects simpson, bouvier, burns and monitor
oc apply -k deployment/

