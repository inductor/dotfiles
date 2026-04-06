#!/bin/sh
echo "==> Installing krew plugins..."
if command -v kubectl &>/dev/null && kubectl krew version &>/dev/null; then
  kubectl krew install ketall 2>/dev/null || true
  kubectl krew install jq 2>/dev/null || true
  kubectl krew install crd-wizard 2>/dev/null || true
else
  echo "   kubectl or krew not found, skipping"
fi
