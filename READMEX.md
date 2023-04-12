# NODEX

A custom deb package installer for NodeJS.

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
