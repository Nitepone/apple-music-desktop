# Apple Music Desktop &nbsp;<img src="./Logo.png" width="48">

An [Electron](https://www.electronjs.org/) app that provides a native Apple Music experience for Linux & Windows

It has an "About" Window that lists the App Version, [Electron](https://www.electronjs.org/), [Chromium](https://www.chromium.org/), [Node](https://nodejs.org/), and [V8](https://v8.dev/) versions for the given Electron version in the package.json.

It has many menu items, adding on top of the default ones, and a tray icon which you can use to focus the app or minimize it to the tray.

## Screenshot
![Screenshot](assets/screenshot.png)

## Installation

See the [Releases](https://github.com/Alex313031/apple-music-desktop/releases).

## Building

The `docker` build path only depends on docker or podman (with docker aliases) to be installed on the host system.

```bash
# Build Command
./build-with-docker.sh --dist

# Run
./dist/apple-music*.AppImage

# Install (lazy, good)
cp ./dist/apple-music*.AppImage ~/.local/bin/apple-music

# Install (lazy, evil)
sudo cp ./dist/apple-music*.AppImage /usr/bin/apple-music
```
