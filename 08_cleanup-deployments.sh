#!/bin/bash

# oc projects | grep ${PREFIX}simpson | awk -F" " '{print $1}'

# Start at the Default Namespace
oc project default

# Cleanup Network Policy Demo Monitor
REMOVEMONITOR=$(oc projects | grep ${MONITORPREFIX:-'network-policy-demo-monitor'} | awk -F" " '{print $1}')
if [ "!${REMOVEMONITOR}" == "" ] ; then
    oc project ${REMOVEMONITOR}
    oc delete all --all
fi

# Cleanup Simpson
REMOVESIMPSON=$(oc projects | grep ${SIMPSONPREFIX:-'simpson'} | awk -F" " '{print $1}')
if [ "!${REMOVESIMPSON}" == "" ] ; then
    oc project ${REMOVESIMPSON}
    oc delete all --all
fi

# Cleanup Bouvier
REMOVEBOUVIER=$(oc projects | grep ${BOUVIERPREFIX:-'bouvier'} | awk -F" " '{print $1}')
if [ "!${REMOVEBOUVIER}" == "" ] ; then
    oc project ${REMOVEBOUVIER}
    oc delete all --all
fi

# Cleanup Burns
REMOVEBURNS=$(oc projects | grep ${BURNSPREFIX:-'bouvier'} | awk -F" " '{print $1}')
if [ "!${REMOVEBURNS}" == "" ] ; then
    oc project ${REMOVEBURNS}
    oc delete all --all
fi

# Cleanup Projects
oc project default

# Remove Network Policy Demo Monitor
if [ "!${REMOVEMONITOR}" == "" ] ; then
    oc delete project ${REMOVEMONITOR}
fi

# Remove Simpson
if [ "!${REMOVESIMPSON}" == "" ] ; then
    oc delete project ${REMOVESIMPSON}
fi

# Remove Bouvier
if [ "!${REMOVEBOUVIER}" == "" ] ; then
    oc delete project ${REMOVEBOUVIER}
fi

# Remove Burns
if [ "!${REMOVEBURNS}" == "" ] ; then
    oc delete project ${REMOVEBURNS}
fi
