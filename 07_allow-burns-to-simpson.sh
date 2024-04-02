#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Allow Burns to Simpson Network Policy
oc apply -f network-policies/05_allow-from-burns-simpson.yaml
