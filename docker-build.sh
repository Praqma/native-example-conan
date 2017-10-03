#!/usr/bin/env bash

docker build --tag praqma/native-conan:latest --file ${PWD}/Dockerfile ${PWD}
