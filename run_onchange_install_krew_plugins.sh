#!/bin/sh
# Install krew plugins for k9s integrations
kubectl krew install ketall 2>/dev/null || true
kubectl krew install jq 2>/dev/null || true
kubectl krew install crd-wizard 2>/dev/null || true
