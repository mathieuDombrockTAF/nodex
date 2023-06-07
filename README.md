# NODEX

A custom deb package installer for NodeJS.

This allows you to easily create a Debian package which installs an arbitrary NodeJS version. 

The resulting package should work in the exact same way that you would expect if you did `apt install node`.  

## Important Notes

- This repo does not contain NodeJS itself. You **need to run `mkdeb.sh` or `update.sh` to download the NodeJS files**.

- Updates are painless, just edit the `setup.sh` script to setup a new NodeJS version.

- This is not a cross-platform build. Currently this is only setup for `linux-arm64`.

## Example
```
$ ls
nodex.deb

$ which node
$ which nodejs 

$ dpkg -i nodex.deb
...

$ which node
/usr/local/bin/node

$ node
Welcome to Node.js v18.15.0.
Type ".help" for more information.
> 
```

In this example we can see that there is no version of NodeJS installed before installing this package. After we install the package, we have NodeJS version 18.15.0 which is **not** available in the Ubuntu repository. 

## How This Works

**Note: The following process is automated as a GH action on the main branch. Just edit `.dpkg/update.sh` to change the node version.**

### Edit `./setup.sh`

Edit the `./setup.sh` file to specify the new version you want to set up.

Make sure your version matches one from the official downloads page:

https://nodejs.org/en/download

### Run `./setup.sh`

Run the setup command:
```
./setup.sh
```

This will download, extract and configure the files in `./deb/usr/`.

### Build The Package

Run the package command:
```
./package.sh
```

This will build and output a deb file to the `./build/` directory.
