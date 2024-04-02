#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Deploy Simpson Openshift Console Samples
oc apply -f deployment/console-samples.yaml
