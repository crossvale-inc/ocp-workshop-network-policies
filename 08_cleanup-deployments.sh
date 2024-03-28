#!/bin/bash

# Start at the Default Namespace
oc project default

# Cleanup Network Policy Demo Monitor
export MONITORPREFIX=${MONITORPREFIX:-'network-policy-demo-monitor'}
export REMOVEMONITOR=$(oc projects | grep ${MONITORPREFIX} | awk -F" " '{print $1}')

if [ ! "${REMOVEMONITOR}" == "" ] ; then
    oc project ${REMOVEMONITOR}
    oc delete all --all
    sleep 1
fi

# Cleanup Simpson
export SIMPSONPREFIX=${SIMPSONPREFIX:-'simpson'}
export REMOVESIMPSON=$(oc projects | grep ${SIMPSONPREFIX} | awk -F" " '{print $1}')
if [ ! "${REMOVESIMPSON}" == "" ] ; then
    oc project ${REMOVESIMPSON}
    oc delete all --all
    sleep 1
fi

# Cleanup Bouvier
export BOUVIERPREFIX=${BOUVIERPREFIX:-'bouvier'}
export REMOVEBOUVIER=$(oc projects | grep ${BOUVIERPREFIX} | awk -F" " '{print $1}')
if [ ! "${REMOVEBOUVIER}" == "" ] ; then
    oc project ${REMOVEBOUVIER}
    oc delete all --all
    sleep 1
fi

# Cleanup Burns
export BURNSPREFIX=${BURNSPREFIX:-'burns'}
export REMOVEBURNS=$(oc projects | grep ${BURNSPREFIX} | awk -F" " '{print $1}')
if [ ! "${REMOVEBURNS}" == "" ] ; then
    oc project ${REMOVEBURNS}
    oc delete all --all
    sleep 1
fi

# Cleanup Projects
oc project default

# Remove Network Policy Demo Monitor
if [ ! "${REMOVEMONITOR}" == "" ] ; then
    oc delete project ${REMOVEMONITOR}
    sleep 1
fi

# Remove Simpson
if [ ! "${REMOVESIMPSON}" == "" ] ; then
    oc delete project ${REMOVESIMPSON}
    sleep 1
fi

# Remove Bouvier
if [ ! "${REMOVEBOUVIER}" == "" ] ; then
    oc delete project ${REMOVEBOUVIER}
    sleep 1
fi

# Remove Burns
if [ ! "${REMOVEBURNS}" == "" ] ; then
    oc delete project ${REMOVEBURNS}
    sleep 1
fi
