#!/bin/bash
curl -s "https://api.nordvpn.com/v1/servers?limit=10000" | jq -r ".[] | select(.technologies[].id | contains(21)) | select(.locations[].country.code | contains(\"CA\")) | .hostname"