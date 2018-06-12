#!/bin/bash

# Author: Ariel Simhon
# Purpose: Check response code

RESPONSE=$(curl -s http://$1.engineering-days.com -I | head -1 | awk '{print $2}')

if [ "$RESPONSE" = 200 ] ; then
  echo "Web is healthy (response $RESPONSE)"
else
  echo "Web is not healthy (response $RESPONSE)"
  exit 1
fi
