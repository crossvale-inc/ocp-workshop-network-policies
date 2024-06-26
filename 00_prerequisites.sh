#!/bin/bash

# Check for existing Environment Vars
rm -f env-vars.sh

# Prompt For Username to be used as Environment Prefix
export PREFIX=
echo "Enter Username"
read PREFIX

# Create Environment Prefix Variables if applicable
if [ ! "${PREFIX}" == "" ] ; then
    echo "FOUND PREFIX -> ${PREFIX}"
    cat <<-EOF > env-vars.sh
#!/bin/bash
export PREFIX=${PREFIX}
# simpson
export SIMPSONPREFIX=${PREFIX}-simpson
export HOMERPREFIX=${PREFIX}-homer
export MARGEPREFIX=${PREFIX}-marge
# bouvier
export BOUVIERPREFIX=${PREFIX}-bouvier
export PATTYPREFIX=${PREFIX}-patty
export SELMAPREFIX=${PREFIX}-selma
# burns
export BURNSPREFIX=${PREFIX}-burns
export MONTYPREFIX=${PREFIX}-monty
# network-policy-demo-monitor
export MONITORPREFIX=${PREFIX}-network-policy-demo-monitor
export MONPREFIX=${PREFIX}-monitor
export DUMMY=$
export SCRIPT_FIELD_SEPARATOR=f1,2
EOF

else
    echo "NO PREFIX"
    cat <<-EOF > env-vars.sh
#!/bin/bash
# simpson
export SIMPSONPREFIX=simpson
export HOMERPREFIX=homer
export MARGEPREFIX=marge
# bouvier
export BOUVIERPREFIX=bouvier
export PATTYPREFIX=patty
export SELMAPREFIX=selma
# burns
export BURNSPREFIX=burns
export MONTYPREFIX=monty
# network-policy-demo-monitor
export MONITORPREFIX=network-policy-demo-monitor
export MONPREFIX=monitor
export DUMMY=$
export SCRIPT_FIELD_SEPARATOR=f1
EOF
fi

# Source Environment Variables
source ./env-vars.sh

# Find and Replace Variables
# simpson
envsubst < deployment/simpson/kustomization.yaml.template > deployment/simpson/kustomization.yaml
envsubst < deployment/simpson/namespace.yaml.template > deployment/simpson/namespace.yaml
envsubst < deployment/simpson/homer-deployment.yaml.template > deployment/simpson/homer-deployment.yaml
envsubst < deployment/simpson/homer-route.yaml.template > deployment/simpson/homer-route.yaml
envsubst < deployment/simpson/homer-service.yaml.template > deployment/simpson/homer-service.yaml
envsubst < deployment/simpson/marge-deployment.yaml.template > deployment/simpson/marge-deployment.yaml
envsubst < deployment/simpson/marge-route.yaml.template > deployment/simpson/marge-route.yaml
envsubst < deployment/simpson/marge-service.yaml.template > deployment/simpson/marge-service.yaml

# bouvier
envsubst < deployment/bouvier/kustomization.yaml.template > deployment/bouvier/kustomization.yaml
envsubst < deployment/bouvier/namespace.yaml.template > deployment/bouvier/namespace.yaml
envsubst < deployment/bouvier/patty-deployment.yaml.template > deployment/bouvier/patty-deployment.yaml
envsubst < deployment/bouvier/patty-route.yaml.template > deployment/bouvier/patty-route.yaml
envsubst < deployment/bouvier/patty-service.yaml.template > deployment/bouvier/patty-service.yaml
envsubst < deployment/bouvier/selma-deployment.yaml.template > deployment/bouvier/selma-deployment.yaml
envsubst < deployment/bouvier/selma-route.yaml.template > deployment/bouvier/selma-route.yaml
envsubst < deployment/bouvier/selma-service.yaml.template > deployment/bouvier/selma-service.yaml

# burns
envsubst < deployment/burns/kustomization.yaml.template > deployment/burns/kustomization.yaml
envsubst < deployment/burns/namespace.yaml.template > deployment/burns/namespace.yaml
envsubst < deployment/burns/monty-deployment.yaml.template > deployment/burns/monty-deployment.yaml
envsubst < deployment/burns/monty-route.yaml.template > deployment/burns/monty-route.yaml
envsubst < deployment/burns/monty-service.yaml.template > deployment/burns/monty-service.yaml

# monitor
envsubst < deployment/monitor/kustomization.yaml.template > deployment/monitor/kustomization.yaml
envsubst < deployment/monitor/namespace.yaml.template > deployment/monitor/namespace.yaml
envsubst < deployment/monitor/configmap-netpol-monitor-html.yaml.template > deployment/monitor/configmap-netpol-monitor-html.yaml
envsubst < deployment/monitor/clusterrole.yaml.template > deployment/monitor/clusterrole.yaml
envsubst < deployment/monitor/deployment.yaml.template > deployment/monitor/deployment.yaml
envsubst < deployment/monitor/rolebinding.yaml.template > deployment/monitor/rolebinding.yaml
envsubst < deployment/monitor/route.yaml.template > deployment/monitor/route.yaml
envsubst < deployment/monitor/service.yaml.template > deployment/monitor/service.yaml
envsubst < deployment/monitor/serviceaccount.yaml.template > deployment/monitor/serviceaccount.yaml

# misc.
envsubst < deployment/console-samples.yaml.template > deployment/console-samples.yaml

#bouvier
#patty
sed "s|#{BOUVIERPREFIX}|${BOUVIERPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml.template > deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{MARGEPREFIX}|${MARGEPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{SIMPSONPREFIX}|${SIMPSONPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{HOMERPREFIX}|${HOMERPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{SELMAPREFIX}|${SELMAPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{PATTYPREFIX}|${PATTYPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{MONTYPREFIX}|${MONTYPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{BURNSPREFIX}|${BURNSPREFIX}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
sed -i '' "s|#{SCRIPT_FIELD_SEPARATOR}|${SCRIPT_FIELD_SEPARATOR}|g" deployment/bouvier/patty-configmap-srv-sh.yaml
#selma
sed "s|#{BOUVIERPREFIX}|${BOUVIERPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml.template > deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{MARGEPREFIX}|${MARGEPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{SIMPSONPREFIX}|${SIMPSONPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{HOMERPREFIX}|${HOMERPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{SELMAPREFIX}|${SELMAPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{PATTYPREFIX}|${PATTYPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{MONTYPREFIX}|${MONTYPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{BURNSPREFIX}|${BURNSPREFIX}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
sed -i '' "s|#{SCRIPT_FIELD_SEPARATOR}|${SCRIPT_FIELD_SEPARATOR}|g" deployment/bouvier/selma-configmap-srv-sh.yaml
#simpson
#homer
sed "s|#{BOUVIERPREFIX}|${BOUVIERPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml.template > deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{MARGEPREFIX}|${MARGEPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{SIMPSONPREFIX}|${SIMPSONPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{HOMERPREFIX}|${HOMERPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{SELMAPREFIX}|${SELMAPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{PATTYPREFIX}|${PATTYPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{MONTYPREFIX}|${MONTYPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{BURNSPREFIX}|${BURNSPREFIX}|g" deployment/simpson/homer-configmap-srv-sh.yaml
sed -i '' "s|#{SCRIPT_FIELD_SEPARATOR}|${SCRIPT_FIELD_SEPARATOR}|g" deployment/simpson/homer-configmap-srv-sh.yaml
#marge
sed "s|#{BOUVIERPREFIX}|${BOUVIERPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml.template > deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{MARGEPREFIX}|${MARGEPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{SIMPSONPREFIX}|${SIMPSONPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{HOMERPREFIX}|${HOMERPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{SELMAPREFIX}|${SELMAPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{PATTYPREFIX}|${PATTYPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{MONTYPREFIX}|${MONTYPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{BURNSPREFIX}|${BURNSPREFIX}|g" deployment/simpson/marge-configmap-srv-sh.yaml
sed -i '' "s|#{SCRIPT_FIELD_SEPARATOR}|${SCRIPT_FIELD_SEPARATOR}|g" deployment/simpson/marge-configmap-srv-sh.yaml
#burns
sed "s|#{BOUVIERPREFIX}|${BOUVIERPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml.template > deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{MARGEPREFIX}|${MARGEPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{SIMPSONPREFIX}|${SIMPSONPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{HOMERPREFIX}|${HOMERPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{SELMAPREFIX}|${SELMAPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{PATTYPREFIX}|${PATTYPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{MONTYPREFIX}|${MONTYPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{BURNSPREFIX}|${BURNSPREFIX}|g" deployment/burns/monty-configmap-srv-sh.yaml
sed -i '' "s|#{SCRIPT_FIELD_SEPARATOR}|${SCRIPT_FIELD_SEPARATOR}|g" deployment/burns/monty-configmap-srv-sh.yaml

# network policies
envsubst < network-policies/01_default-deny-simpson.yaml.template > network-policies/01_default-deny-simpson.yaml
envsubst < network-policies/01_default-deny-bouvier.yaml.template > network-policies/01_default-deny-bouvier.yaml
envsubst < network-policies/01_default-deny-burns.yaml.template > network-policies/01_default-deny-burns.yaml
envsubst < network-policies/02_allow-from-openshift-ingress-simpson.yaml.template > network-policies/02_allow-from-openshift-ingress-simpson.yaml
envsubst < network-policies/03_allow-same-namespace-simpson.yaml.template > network-policies/03_allow-same-namespace-simpson.yaml
envsubst < network-policies/03_allow-same-namespace-bouvier.yaml.template > network-policies/03_allow-same-namespace-bouvier.yaml
envsubst < network-policies/03_allow-same-namespace-burns.yaml.template > network-policies/03_allow-same-namespace-burns.yaml
envsubst < network-policies/04_allow-from-bouviers-to-marge-simpson.yaml.template > network-policies/04_allow-from-bouviers-to-marge-simpson.yaml
envsubst < network-policies/05_allow-from-burns-simpson.yaml.template > network-policies/05_allow-from-burns-simpson.yaml

