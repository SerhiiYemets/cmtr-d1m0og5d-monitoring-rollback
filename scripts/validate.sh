#!/bin/bash
set -e

for i in {1..20}; do
  if curl -fsS http://localhost:8000/health; then
    exit 0
  fi
  sleep 2
done

exit 1
