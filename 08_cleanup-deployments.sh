#!/bin/bash

# oc projects | grep ${PREFIX}simpson | awk -F" " '{print $1}'

# Cleanup Network Policy Demo Monitor
oc project ${MONITORPREFIX:-'network-policy-demo-monitor'}
oc delete all --all

# Cleanup Simpson
oc project ${SIMPSONPREFIX:-'simpson'}
oc delete all --all

# Cleanup Bouvier
oc project ${BOUVIERPREFIX:-'bouvier'}
oc delete all --all

# Cleanup Burns
oc project ${BURNSPREFIX:-'burns'}
oc delete all --all

# Cleanup Projects
oc project default
oc delete project ${MONITORPREFIX:-'network-policy-demo-monitor'}
oc delete project ${SIMPSONPREFIX:-'simpson'}
oc delete project ${BOUVIERPREFIX:-'bouvier'}
oc delete project ${BURNSPREFIX:-'burns'}

