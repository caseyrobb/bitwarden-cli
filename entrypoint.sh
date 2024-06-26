#!/bin/bash
set -e

bw config server ${BW_HOST} --response --pretty

export BW_SESSION=$(bw login ${BW_USERNAME} --passwordenv BW_PASSWORD --nointeraction --raw)

bw unlock --response --nointeraction --pretty --passwordenv BW_PASSWORD
bw serve --hostname 0.0.0.0 --response --nointeraction --pretty
