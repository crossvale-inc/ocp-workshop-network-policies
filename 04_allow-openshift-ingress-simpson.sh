#!/bin/bash

# Allow From OpenShift Ingress to Simpson Network Policy
oc apply -f network-policies/02_allow-from-openshift-ingress-simpson.yaml
