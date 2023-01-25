#!/bin/sh -eux

echo "Env names defined"
printenv | cut -d '=' -f 1

echo "Replacing ENVs"
envsubst < /etc/vigil.cfg > /tmp/vigil.cfg

echo "Running vigil"
vigil -c /tmp/vigil.cfg