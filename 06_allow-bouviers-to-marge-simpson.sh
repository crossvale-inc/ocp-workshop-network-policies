#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Allow Bouviers to Marge Simpson Network Policy
oc apply -f network-policies/04_allow-from-bouviers-to-marge-simpson.yaml
