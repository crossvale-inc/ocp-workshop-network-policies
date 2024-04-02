#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Default Deny Simpson Network Policy
oc apply -f network-policies/01_default-deny.yaml
