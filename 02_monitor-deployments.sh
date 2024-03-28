#!/bin/bash

# Network Monitor the Deployments
oc logs --tail=1 -f deployment/monitor -n network-policy-demo-monitor
