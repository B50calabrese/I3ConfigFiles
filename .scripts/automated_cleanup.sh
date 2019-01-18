#!/bin/bash

DATE=`date +%Y-%m-%d`
CITC_CLIENT_NAME="automated_cleanup_"${DATE}""

cd /google/src/cloud/acalabrese
cd "$(p4 g4d -f "${CITC_CLIENT_NAME}")"

