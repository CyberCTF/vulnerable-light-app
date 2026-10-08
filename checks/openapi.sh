#!/bin/sh
# The OpenAPI document lists the lab's endpoints (served over HTTPS with a self-signed certificate).
set -e
out=$(curl -fsSk https://web:3000/swagger/v1/swagger.json)
echo "$out" | grep -q "LocalDNSResolver"
