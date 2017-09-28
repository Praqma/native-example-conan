#!/usr/bin/env bash

# git submodule update --init
# conan remove "*" --src --builds --force
# git clean -dfx && git submodule foreach "git clean -dfx"

docker run --rm --tty --interactive --workdir=/workspace --volume ${PWD}:/workspace praqma/native-conan:0.0.1 bash
