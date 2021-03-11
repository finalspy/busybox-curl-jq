FROM alpine:3.13.2 AS builder
WORKDIR /workdir
RUN apk update && apk add --no-cache \
        git==2.30.2-r0 \
        autoconf==2.69-r3 \
        automake==1.16.3-r0 \
        libtool==2.4.6-r7 \
        build-base==0.5-r2 \
        clang=10.0.1-r0 \
        openssl-dev=1.1.1j-r0 \
        openssl-libs-static=1.1.1j-r0 \
        nghttp2-dev=1.42.0-r1 \
        nghttp2-static=1.42.0-r1 \
        libssh2-dev=1.9.0-r1 \
        libssh2-static=1.9.0-r1 \
        zlib-static=1.2.11-r3
RUN git clone --depth 1 -b curl-7_75_0 https://github.com/curl/curl.git 
RUN git clone --depth 1 --recurse-submodules --shallow-submodules -b jq-1.6 https://github.com/stedolan/jq.git
WORKDIR /workdir/curl
RUN autoreconf -fi \
    && ./configure --disable-shared --enable-static --disable-ldap --enable-ipv6 --enable-unix-sockets --with-ssl --with-libssh2 >config.out 2>&1 \
    && make -j$(nproc) V=1 curl_LDFLAGS=-all-static > make.out 2>&1 \
    && strip src/curl
WORKDIR /workdir/jq
RUN autoreconf -fi \
    && ./configure --disable-docs --disable-maintainer-mode --with-oniguruma >config.out 2>&1 \
    && make -j$(nproc) LDFLAGS=-all-static > make.out 2>&1 \
    && strip jq

FROM busybox:1.32.1
COPY --from=builder /workdir/curl/src/curl /bin/
RUN chmod 755 /bin/curl
COPY --from=builder /workdir/jq/jq /bin/
RUN chmod 755 /bin/jq
USER nobody