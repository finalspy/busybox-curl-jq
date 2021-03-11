# busybox-curl-jq

This is a [busybox](https://github.com/mirror/busybox) customized with [curl](https://github.com/curl/curl) and [jq](https://github.com/stedolan/jq).

Image is build in two steps.
First static compile curl and jq from github sources on an alpine image.
Then copy binaries to a busybox image.

## Releases

Docker images can be found on [dockerhub](https://hub.docker.com/r/finalspy/busybox-curl-jq).

### 2021-03-11 - 1.0.2

Update this readme file.

### 2021-03-10 - 1.0.1

Update GIT version used to build the image to v2.30.2-r0.

### 2021-03-09 - 1.0.0 - First Release

- [busybox (1.32.1)](https://hub.docker.com/layers/busybox/library/busybox/1.32.1/images/sha256-8dc1fb3593f9b5a49f70c7f8e59d7a31a2d03a7ae7170350d9a7be8486993b53?context=explore)
- [curl (7.75.0)](https://github.com/curl/curl/releases/tag/curl-7_75_0)
- [jq (1.6)](https://github.com/stedolan/jq/releases/tag/jq-1.6)
- build with [Alpine (3.13)](https://alpinelinux.org/posts/Alpine-3.13.0-released.html)

## Manual Build

You want to build this image yourself ?
Just run in your linux terminal :

    docker build -t finalspy/busybox-curl-jq:my_own_local_build .

For windows folks use WSL2 ;)

## Note on buildkit

To get a faster build and a smaller image size (optimized layers) please use buildkit as your default builder :

    export DOCKER_BUILDKIT=1
