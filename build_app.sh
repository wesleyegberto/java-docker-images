#!/usr/bin/env bash
set -e errexit
cd hello-app
mvn -Dmaven.test.skip=true clean package