#!/bin/sh

# This script waits until a DNS server returns an expected ip address for a given domain.

set -e
set -u

usage() {
  echo "Usage: $0 DOMAIN_NAME EXPECTED_IP"
}

if [ "$#" -ne 2 ]; then
  usage
  exit 1
fi

DOMAIN_NAME="$1"
EXPECTED_IP="$2"

DNS_IP="$(nslookup "${DOMAIN_NAME}" | grep Address | awk 'NR==2 {print $2; exit}')"

while [ "${EXPECTED_IP}" != "${DNS_IP}" ]; do
    echo "${DOMAIN_NAME} resolved to ${DNS_IP} (expected: ${EXPECTED_IP})"
    sleep 5
    DNS_IP=$(nslookup "${DOMAIN_NAME}" | grep Address | awk 'NR==2 {print $2; exit}')
done
