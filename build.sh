#!/bin/bash

docker build \
    --build-arg BUILD_FROM="homeassistant/aarch64-base:latest" \
    -t local/pi_plates .
