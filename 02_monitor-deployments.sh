#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Network Monitor the Deployments
oc logs --tail=1 -f deployment/monitor -n network-policy-demo-monitor
