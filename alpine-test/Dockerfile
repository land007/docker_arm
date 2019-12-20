FROM alpine

MAINTAINER Jia Yiqiu <yiqiujia@hotmail.com>

RUN apk --no-cache add curl

#> docker buildx create --name mybuilder
#> docker buildx use mybuilder
#> docker buildx build --platform linux/amd64 -t alpine-amd64 --load .
#> docker buildx build --platform linux/arm64 -t alpine-arm64 --load .
#> docker buildx build --platform linux/arm/v7 -t alpine-arm32 --load .

#> docker run --rm alpine-amd64 uname -a
#  Linux 4bc3bd4b8ff0 4.9.125-linuxkit #1 SMP Fri Sep 7 08:20:28 UTC 2018 x86_64 Linux
#> docker run --rm alpine-arm64 uname -a
#  Linux 404631ac3379 4.9.125-linuxkit #1 SMP Fri Sep 7 08:20:28 UTC 2018 aarch64 Linux
#> docker run --rm alpine-arm32 uname -a
#  Linux 5a869d794098 4.9.125-linuxkit #1 SMP Fri Sep 7 08:20:28 UTC 2018 armv7l Linux

#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/alpine-test --push .
#> docker run --rm land007/alpine-test uname -m
#  x86_64
#> docker run --rm land007/alpine-test:latest@sha256:eb5b56ee100e4e2ae789df562356866025cfb20e076a1bda0bf10b63dc28419e uname -m
#  armv7l