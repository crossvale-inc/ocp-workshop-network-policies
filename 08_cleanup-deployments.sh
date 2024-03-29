#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Start at the Default Namespace
oc project default

# Cleanup Network Policy Demo Monitor
#export MONITORPREFIX=${MONITORPREFIX:-'network-policy-demo-monitor'}
#export REMOVEMONITOR=$(oc projects | grep ${MONITORPREFIX} | awk -F" " '{print $1}')

if [ ! "${MONITORPREFIX}" == "" ] ; then
    oc project ${MONITORPREFIX}
    oc delete all --all
    sleep 1
fi

# Cleanup Simpson
#export SIMPSONPREFIX=${SIMPSONPREFIX:-'simpson'}
#export REMOVESIMPSON=$(oc projects | grep ${SIMPSONPREFIX} | awk -F" " '{print $1}')
if [ ! "${SIMPSONPREFIX}" == "" ] ; then
    oc project ${SIMPSONPREFIX}
    oc delete all --all
    sleep 1
fi

# Cleanup Bouvier
#export BOUVIERPREFIX=${BOUVIERPREFIX:-'bouvier'}
#export REMOVEBOUVIER=$(oc projects | grep ${BOUVIERPREFIX} | awk -F" " '{print $1}')
if [ ! "${BOUVIERPREFIX}" == "" ] ; then
    oc project ${BOUVIERPREFIX}
    oc delete all --all
    sleep 1
fi

# Cleanup Burns
#export BURNSPREFIX=${BURNSPREFIX:-'burns'}
#export REMOVEBURNS=$(oc projects | grep ${BURNSPREFIX} | awk -F" " '{print $1}')
if [ ! "${BURNSPREFIX}" == "" ] ; then
    oc project ${BURNSPREFIX}
    oc delete all --all
    sleep 1
fi

# Cleanup Projects
oc project default

# Remove Network Policy Demo Monitor
if [ ! "${MONITORPREFIX}" == "" ] ; then
    oc delete project ${MONITORPREFIX}
    sleep 1
fi

# Remove Simpson
if [ ! "${SIMPSONPREFIX}" == "" ] ; then
    oc delete project ${SIMPSONPREFIX}
    sleep 1
fi

# Remove Bouvier
if [ ! "${BOUVIERPREFIX}" == "" ] ; then
    oc delete project ${BOUVIERPREFIX}
    sleep 1
fi

# Remove Burns
if [ ! "${BURNSPREFIX}" == "" ] ; then
    oc delete project ${BURNSPREFIX}
    sleep 1
fi

# Remove Generated Template Files
# monitor
rm -f deployment/monitor/kustomization.yaml
rm -f deployment/monitor/namespace.yaml
rm -f deployment/monitor/configmap-netpol-monitor-html.yaml
# simpson
rm -f deployment/simpson/kustomization.yaml
rm -f deployment/simpson/namespace.yaml
# bouvier
rm -f deployment/bouvier/kustomization.yaml
rm -f deployment/bouvier/namespace.yaml
# burns
rm -f deployment/burns/kustomization.yaml
rm -f deployment/burns/namespace.yaml

# network policies
rm -f network-policies/01_default-deny-simpson.yaml
rm -f network-policies/02_allow-from-openshift-ingress-simpson.yaml
rm -f network-policies/03_allow-same-namespace-simpson.yaml
rm -f network-policies/04_allow-from-bouviers-to-marge-simpson.yaml
rm -f network-policies/05_allow-from-burns-simpson.yaml

# Remove Environment Vars Script
rm -f env-vars.sh