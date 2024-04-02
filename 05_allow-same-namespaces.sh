#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Allow From Same Namespace to Simpson Network Policy
oc apply -f network-policies/03_allow-same-namespace-simpson.yaml

# Allow From Same Namespace to Bouvier Network Policy
oc apply -f network-policies/03_allow-same-namespace-bouvier.yaml

# Allow From Same Namespace to Burns Network Policy
oc apply -f network-policies/03_allow-same-namespace-burns.yaml
