#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Default Deny Simpson Network Policy
oc apply -f network-policies/01_default-deny-simpson.yaml

# Default Deny Bouvier Network Policy
oc apply -f network-policies/01_default-deny-bouvier.yaml

# Default Deny Burns Network Policy
oc apply -f network-policies/01_default-deny-burns.yaml
