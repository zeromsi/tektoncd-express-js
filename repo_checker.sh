#!/bin/bash
status="$(curl -Is $NEXUS_NPM_GROUP_URL --connect-timeout 10 | head -1)";validate=( $status );if [ ${validate[1]} == "401" ]; then npm config set registry $NEXUS_NPM_GROUP_URL && npm config set _auth $NEXUS_TOKEN;echo $registry-url; fi

