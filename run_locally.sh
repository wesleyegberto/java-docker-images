#!/usr/bin/env bash
set -e errexit
sh build_app.sh
java -jar hello-app/target/hello-app.jar