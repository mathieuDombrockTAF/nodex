#! /bin/bash
VERSION="v18.15.0"
NODE_URL="https://nodejs.org/dist/$VERSION/node-$VERSION-linux-x64.tar.xz"
# https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.xz

echo "Downloading NodeJS: $VERSION..."
echo "From $NODE_URL"
wget $NODE_URL

echo "Extracting Archive..."
tar -xJf *.tar.xz || exit 1

echo "Removing Archive..."
rm *.tar.xz

echo "Removing Old Bin..."
rm -rf ./deb/usr/local/*

echo "Renaming Archive Output..."
mv node*/* ./deb/usr/local/

echo "Moving License and Meta..."
mv -f ./deb/usr/local/README.md ./README.nodejs.md
mv -f ./deb/usr/local/*.md .
mv -f ./deb/usr/local/LICENSE .

echo "--------"
echo "Done!"