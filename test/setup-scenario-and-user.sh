#!/usr/bin/env sh
echo PUTing Industrialists Scenario
curl -vH "Content-Type: application/json" -X PUT --data "@scenarios/industrialists.json" http://localhost:4567/scenario/industrialists
echo PUTing Mil User
curl -vH "Content-Type: application/json" -X PUT --data "@users/mil.json" http://localhost:4567/user/666
