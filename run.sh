#!/bin/bash

set -e

function start_app {
	docker-compose up -d
}

function stop_all {
	opts=""
	if [[ "$1" == "--volumes" ]]; then
		opts="-v"
	fi
	docker-compose down ${opts}
}

case "$1" in
	"--up" )
		start_app
	;;

	"--down" )
		stop_all ${@:2}
	;;

	* )
		docker-compose ${@:1}
	;;
esac
