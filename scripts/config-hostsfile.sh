#!/usr/bin/env bash

HOSTS_ALIAS="127.0.0.1 seed.rykerdefense.local";

if ! grep -q "$HOSTS_ALIAS" /etc/hosts; then
  echo "Adding host configuration for ${HOSTS_ALIAS}";
  echo $HOSTS_ALIAS | sudo tee -a /etc/hosts;
  echo "Host successfully configured!\n";
else
    echo "Host has already been configured, skipping step.."
fi

