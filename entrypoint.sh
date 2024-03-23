#!/bin/bash
set -e

bw config server ${BW_HOST} --response --pretty

export BW_SESSION=$(bw login --apikey --raw --nointeraction)

bw unlock --check --response --nointeraction --pretty
bw serve --hostname 0.0.0.0 --response --nointeraction --pretty
