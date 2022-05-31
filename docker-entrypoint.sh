#!/bin/bash

set -x

while [[ $# -gt 0 ]]; do
  case $1 in
    -b|--build)
      BUILD_CMD=$2
      shift
      shift
      ;;
    -*|--*)
      printf "Usage: valgrind [-b,--build BUILD_CMD] ./YOUR_FILE\n"
      exit 1
      ;;
    *)
      BUILD_CMD=${BUILD_CMD:="make"}
      break
      ;;
  esac
done

eval $BUILD_CMD
if [[ $? -gt 0 ]]; then
  exit $?
fi

if [[ "$1" == "./"* ]]; then
  isSanitize=$(nm -an "$1" | grep "asan")
  if [[ $? -eq 0 ]]; then
    printf "error: must be compile without '-fsanitize'\n"
    exit 1
  fi
fi

OPT="--leak-check=full --track-origins=yes --show-leak-kinds=all --show-reachable=yes"
valgrind $OPT "$@"
