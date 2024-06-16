#!/usr/bin/env bash
set -e errexit
ab -n 10000 -c 50 http://localhost:8080/greetings