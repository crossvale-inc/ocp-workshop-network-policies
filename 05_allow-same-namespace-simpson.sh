#!/bin/bash

# Allow From Same Namespace to Simpson Network Policy
oc apply -f network-policies/03_allow-same-namespace-simpson.yaml
