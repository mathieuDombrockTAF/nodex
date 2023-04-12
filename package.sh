#! /bin/bash

PKG_NAME="nodex"

# Setup/cleanup
mkdir ./build
echo "Cleaning build dir..."
rm ./build/*

# Run the actual packaging step
dpkg-deb -b ./deb ./build/$PKG_NAME.deb

# Confirm built
echo "-------"
echo "Built deb package OK!"
echo "Install with:"
echo "\`\`\`"
echo "dpkg -i ./build/$PKG_NAME.deb"
echo "\`\`\`"