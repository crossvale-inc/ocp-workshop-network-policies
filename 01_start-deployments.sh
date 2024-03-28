#!/bin/bash

# Kustomize Deployment of the Projects simpson, bouvier, burns and monitor
oc apply -k deployment/
echo.
echo "Deployments, Pods, Services and Routes Created!"
