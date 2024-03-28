#!/bin/bash

# Prompt For Username to be used as Environment Prefix
export PREFIX=
echo "Enter Username"
read PREFIX
export PREFIX=${PREFIX}

# Create Environment Prefix Variables if applicable
if [ ! "${PREFIX}" == "" ] ; then
    # simpson
    export SIMPSONPREFIX=${PREFIX}-simpson
    # bouvier
    export BOUVIERPREFIX=${PREFIX}-bouvier
    # burns
    export BURNSPREFIX=${PREFIX}-burns
    # network-policy-demo-monitor
    export MONITORPREFIX=${PREFIX}-network-policy-demo-monitor
else
    # simpson
    export SIMPSONPREFIX=simpson
    # bouvier
    export BOUVIERPREFIX=bouvier
    # burns
    export BURNSPREFIX=burns
    # network-policy-demo-monitor
    export MONITORPREFIX=network-policy-demo-monitor
fi


