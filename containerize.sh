#!/usr/bin/env bash

# git submodule update --init
# conan remove "*" --src --builds --force
# git submodule foreach "git clean -dfx"

docker run --rm -it -v ${PWD}:${HOME}/workspace praqma/native-conan:0.0.1 ./gradlew tasks

# docker run --rm -it -v ${PWD}:/workspace praqma/native-conan:0.0.1 bash
# docker run --rm -it -v ${PWD}:/workspace praqma/native-conan:0.0.1 java -version
