#! /bin/bash

echo "Running update"
./update.sh || exit 1

echo "Building package"
./build.sh || exit 1
