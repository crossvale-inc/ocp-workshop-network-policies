#!/bin/bash

# Source Environment Variables
source ./env-vars.sh

# Start at the Default Namespace
oc project default

# Cleanup Network Policy Demo Monitor
if [ ! "${MONITORPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVEMONITOR=$(oc projects | grep ${MONITORPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVEMONITOR}" == "" ] ; then
        oc project ${REMOVEMONITOR}
        oc delete all --all
        sleep 1
    fi
fi

# Cleanup Simpson
if [ ! "${SIMPSONPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVESIMPSON=$(oc projects | grep ${SIMPSONPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVESIMPSON}" == "" ] ; then
        oc project ${REMOVESIMPSON}
        oc delete all --all
        sleep 1
    fi
fi

# Cleanup Bouvier
if [ ! "${BOUVIERPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVEBOUVIER=$(oc projects | grep ${BOUVIERPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVEBOUVIER}" == "" ] ; then
        oc project ${REMOVEBOUVIER}
        oc delete all --all
        sleep 1
    fi
fi

# Cleanup Burns
if [ ! "${BURNSPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVEBURNS=$(oc projects | grep ${BURNSPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVEBURNS}" == "" ] ; then
        oc project ${REMOVEBURNS}
        oc delete all --all
        sleep 1
    fi
fi

# Cleanup Projects
oc project default

# Remove Network Policy Demo Monitor
if [ ! "${MONITORPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVEMONITOR=$(oc projects | grep ${MONITORPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVEMONITOR}" == "" ] ; then
        oc delete project ${REMOVEMONITOR}
        sleep 1
    fi
fi

# Remove Simpson
if [ ! "${SIMPSONPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVESIMPSON=$(oc projects | grep ${SIMPSONPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVESIMPSON}" == "" ] ; then
        oc delete project ${REMOVESIMPSON}
        sleep 1
    fi
fi

# Remove Bouvier
if [ ! "${BOUVIERPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVEBOUVIER=$(oc projects | grep ${BOUVIERPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVEBOUVIER}" == "" ] ; then
        oc delete project ${REMOVEBOUVIER}
        sleep 1
    fi
fi

# Remove Burns
if [ ! "${BURNSPREFIX}" == "" ] ; then
    # Check if Project exists
    export REMOVEBURNS=$(oc projects | grep ${BURNSPREFIX} | awk -F" " '{print $1}')
    if [ ! "${REMOVEBURNS}" == "" ] ; then
        oc delete project ${REMOVEBURNS}
        sleep 1
    fi
fi

# Remove Generated Template Files
# monitor
rm -f deployment/monitor/kustomization.yaml
rm -f deployment/monitor/namespace.yaml
rm -f deployment/monitor/configmap-netpol-monitor-html.yaml
rm -f deployment/monitor/clusterrole.yaml
rm -f deployment/monitor/deployment.yaml
rm -f deployment/monitor/rolebinding.yaml
rm -f deployment/monitor/route.yaml
rm -f deployment/monitor/service.yaml
rm -f deployment/monitor/serviceaccount.yaml
# simpson
rm -f deployment/simpson/kustomization.yaml
rm -f deployment/simpson/namespace.yaml
rm -f deployment/simpson/homer-deployment.yaml
rm -f deployment/simpson/homer-route.yaml
rm -f deployment/simpson/homer-service.yaml
rm -f deployment/simpson/marge-deployment.yaml
rm -f deployment/simpson/marge-route.yaml
rm -f deployment/simpson/marge-service.yaml
# bouvier
rm -f deployment/bouvier/kustomization.yaml
rm -f deployment/bouvier/namespace.yaml
rm -f deployment/bouvier/patty-deployment.yaml
rm -f deployment/bouvier/patty-route.yaml
rm -f deployment/bouvier/patty-service.yaml
rm -f deployment/bouvier/selma-deployment.yaml
rm -f deployment/bouvier/selma-route.yaml
rm -f deployment/bouvier/selma-service.yaml
# burns
rm -f deployment/burns/kustomization.yaml
rm -f deployment/burns/namespace.yaml
rm -f deployment/burns/monty-deployment.yaml
rm -f deployment/burns/monty-route.yaml
rm -f deployment/burns/monty-service.yaml
# misc.
rm -f deployment/console-samples.yaml
rm -f deployment/configmap-srv-sh.yaml

# network policies
rm -f network-policies/01_default-deny-simpson.yaml
rm -f network-policies/02_allow-from-openshift-ingress-simpson.yaml
rm -f network-policies/03_allow-same-namespace-simpson.yaml
rm -f network-policies/04_allow-from-bouviers-to-marge-simpson.yaml
rm -f network-policies/05_allow-from-burns-simpson.yaml

# Remove Environment Vars Script
rm -f env-vars.sh