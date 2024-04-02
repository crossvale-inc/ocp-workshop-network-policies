# Network Policy Demo

Official documentation: [About network policy](https://docs.openshift.com/container-platform/latest/networking/network_policy/about-network-policy.html)

Based on a blog post done here - [Network Policy Demo](https://examples.openshift.pub/networking/network-policy/OpenShiftSDN/​)


## Environment

![demo overview](demo-overview-v2.png)

## Prerequisites
```bash
git clone https://github.com/crossvale-inc/ocp-workshop-network-policies
cd ocp-workshop-network-policies
# Enter your username when prompted to create namespaces prefixed with username E.g. chamilton-simpsons, chamilton-bouvier, etc.
./00_prerequisites.sh
```

## Deploy Environment
```bash
# This will deploy the applications for Homer, Marge, Selma, Patty, Monty and Monitor to the prefixed namespaces respectively
./01_start-deployments.sh
```

## Optional: Deploy OpenShift Console samples

![OpenShift Console](ocp-console.png)

```bash
# Optional: This will deploy the Network Policy Samples related to the Simpson Lab.  This is not required to make the lab work.
./01b_deploy-openshift-console-samples.sh
```
## Start Monitoring Logs

### Option 1) via Pod
Watch logs:

```bash
# This will show the logs from the Network Monitor Pod
./02_monitor-deployments.sh
```
<!---
### Option 2) Local tmux script

```bash
curl -L -O {{ page.canonical_url }}run-tmux.sh

# Get OpenShift Wildcard domain:
WILDCARD_DOMAIN=$( oc get ingresscontroller/default -n openshift-ingress-operator -o jsonpath="{.status.domain}" )


# Start tmux
sh run-tmux.sh $WILDCARD_DOMAIN
```

![tmux](tmux-example.png){ width="640" }

--->

## Network Policy - Default Deny Namespaces
```bash
# This will block any traffic to and from namespaces and within namespaces
./03_default-deny-namespaces.sh
```
![network-policies/01_default-deny-simpson.png](network-policies/01_default-deny-simpson.png)

## Step 2) Allow ingress


=== "OC"

```bash
oc apply -f network-policies/02_allow-from-openshift-ingress-simpson.yaml
```

=== "network-policies/02_allow-from-openshift-ingress-simpson.yaml"

```yaml
--8<-- "content/networking/network-policy/network-policy-demo/network-policies/02_allow-from-openshift-ingress-simpson.yaml"
```


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![02_allow-from-openshift-ingress-simpson.png](02_allow-from-openshift-ingress-simpson.png){ width="640" }



## Step 3) Allow ingress


=== "OC"

```bash
oc apply -f network-policies/03_allow-same-namespace-simpson.yaml
```

=== "network-policies/03_allow-same-namespace-simpson.yaml"

```yaml
--8<-- "content/networking/network-policy/network-policy-demo/network-policies/03_allow-same-namespace-simpson.yaml"
```


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![network-policies/03_allow-same-namespace-simpson.png](network-policies/03_allow-same-namespace-simpson.png){ width="640" }


## Step 4) Allow from Bouviers to Marge Simpson


=== "OC"

```bash
oc apply -f network-policies/04_allow-from-bouviers-to-marge-simpson.yaml
```

=== "network-policies/04_allow-from-bouviers-to-marge-simpson.yaml"

```yaml
--8<-- "content/networking/network-policy/network-policy-demo/network-policies/04_allow-from-bouviers-to-marge-simpson.yaml"
```


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![network-policies/04_allow-from-bouviers-to-marge-simpson.png](network-policies/04_allow-from-bouviers-to-marge-simpson.png){ width="640" }


## Step 5) Allow from Burns to Simpson


=== "OC"

```bash
oc apply -f network-policies/05_allow-from-burns-simpson.yaml
```

=== "network-policies/05_allow-from-burns-simpson.yaml"

```yaml
--8<-- "content/networking/network-policy/network-policy-demo/network-policies/05_allow-from-burns-simpson.yaml"
```


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![network-policies/05_allow-from-burns-simpson.png](network-policies/05_allow-from-burns-simpson.png){ width="640" }





