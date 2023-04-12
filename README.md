# NODEX

A custom deb package installer for NodeJS.

This allows you to easily create a Debian package which installs an arbitrary NodeJS version. 

The resulting package should work in the exact same way that you would expect if you did `apt install node`.  

See the [Original NodeJS README.md](README.nodejs.md) for more info on the NodeJS version packaged here.

See [CHANGELOG.md](CHANGELOG.md) to check which version of Node is packaged here currently. 

## Important Notes

- Updates are painless, just edit the `setup.sh` script to setup a new NodeJS version.

- This is not a cross-platform build. Currently this is only setup for `linux-x64`.

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
