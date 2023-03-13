#!/bin/bash

function usage() {
	local exit_code="${1:-0}"

	echo "Usage: ${0} HOST VERSION"

	exit "${exit_code}"
}

host="${1}"

if [ "${host}" == "" ]; then
	usage 1
fi

scp install.sh ubuntu@${host}:/tmp

ssh ubuntu@${host} "/tmp/install.sh"
