#!/bin/bash

set -e

bw config server ${BW_HOST} --response

export BW_SESSION=$(bw login ${BW_USERNAME} --passwordenv BW_PASSWORD --raw)

bw unlock --check --response --nointeraction

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 --response --nointeraction 
