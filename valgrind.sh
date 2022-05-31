#!/bin/bash

set -x

VALGRIND_IMAGE=${VALGRIND_IMAGE:="seushin/valgrind"}

function valgrind() {
  docker run -it --rm -v "$PWD:/src" "$VALGRIND_IMAGE":latest "$@"
}

valgrind "$@"
