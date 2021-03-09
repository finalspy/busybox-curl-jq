# busybox-curl-jq

This is a busybox customized with curl and jq.

Image is build in two steps.
First static compile curl and jq from github sources on an alpine image.
Then copy binaries to a busybox image.

## Releases

### 2021-03-09 First Release

- busybox (1.32.1)
- curl (7.75.0)
- jq (1.6)
