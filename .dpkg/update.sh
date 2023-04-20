#! /bin/bash

# Config
VERSION="14.21.3"
PLATFORM="linux-arm64" 

NODE_URL="https://nodejs.org/dist/v$VERSION/node-v$VERSION-$PLATFORM.tar.xz"
# https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.xz
# https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-arm64.tar.xz

echo "Downloading NodeJS: $VERSION"
echo "From $NODE_URL"
wget $NODE_URL || exit 1

echo "Extracting archive"
tar -xJf *.tar.xz || exit 1

echo "Removing archive"
rm *.tar.xz || exit 1

echo "Removing old bin"
rm -rf ./deb/usr/local/*

echo "Moving archive output"
mv node*/* ./deb/usr/local/ || exit 1

echo "Creating local dir"
mkdir -p ./deb/usr/local/

echo "Moving license and meta to parent repo"
mv -f ./deb/usr/local/README.md ./README.nodejs.md
mv -f ./deb/usr/local/*.md .
mv -f ./deb/usr/local/LICENSE .

echo "--------"
echo "Done!"
