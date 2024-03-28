#!/bin/bash

# Cleanup Network Policy Demo Monitor
oc project network-policy-demo-monitor
oc delete all --all

# Cleanup Simpsons
oc project simpsons
oc delete all --all

# Cleanup Bouvier
oc project bouvier
oc delete all --all

# Cleanup Burns
oc project burns
oc delete all --all

# Cleanup Projects
oc project default
oc delete project network-policy-demo-monitor
oc delete project simpsons
oc delete project bouvier
oc delete project burns

