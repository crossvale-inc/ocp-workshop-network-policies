#!/bin/bash

# Check for existing Environment Vars
rm -f env-vars.sh

# Prompt For Username to be used as Environment Prefix
export PREFIX=
echo "Enter Username"
read PREFIX

# Create Environment Prefix Variables if applicable
if [ ! "${PREFIX}" == "" ] ; then
    echo "FOUND PREFIX"
    cat <<-EOF > env-vars.sh
#!/bin/bash
export PREFIX=${PREFIX}
# simpson
export SIMPSONPREFIX=${PREFIX}-simpson
# bouvier
export BOUVIERPREFIX=${PREFIX}-bouvier
# burns
export BURNSPREFIX=${PREFIX}-burns
# network-policy-demo-monitor
export MONITORPREFIX=${PREFIX}-network-policy-demo-monitor
EOF

else
    echo "NO PREFIX"
    cat <<-EOF > env-vars.sh
#!/bin/bash
# simpson
export SIMPSONPREFIX=simpson
# bouvier
export BOUVIERPREFIX=bouvier
# burns
export BURNSPREFIX=burns
# network-policy-demo-monitor
export MONITORPREFIX=network-policy-demo-monitor
EOF
fi

# Source Environment Variables
source ./env-vars.sh

# Find and Replace Variables
#sed -i "s|BOUVIERPREFIX|$BOUVIERPREFIX|g" deployment/bouvier/kustomization.yaml
#sed -i "s|BOUVIERPREFIX|$BOUVIERPREFIX|g" deployment/bouvier/namespace.yaml

# simpson
envsubst < deployment/simpson/kustomization.yaml.template > deployment/simpson/kustomization.yaml
envsubst < deployment/simpson/namespace.yaml.template > deployment/simpson/namespace.yaml

# bouvier
envsubst < deployment/bouvier/kustomization.yaml.template > deployment/bouvier/kustomization.yaml
envsubst < deployment/bouvier/namespace.yaml.template > deployment/bouvier/namespace.yaml

# burns
envsubst < deployment/burns/kustomization.yaml.template > deployment/burns/kustomization.yaml
envsubst < deployment/burns/namespace.yaml.template > deployment/burns/namespace.yaml

# monitor
envsubst < deployment/monitor/kustomization.yaml.template > deployment/monitor/kustomization.yaml
envsubst < deployment/monitor/namespace.yaml.template > deployment/monitor/namespace.yaml
envsubst < deployment/monitor/configmap-netpol-monitor-html.yaml.template > deployment/monitor/configmap-netpol-monitor-html.yaml
