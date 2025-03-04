ARG GOLANG_IMAGE_TAG="1.23.6-alpine3.21"
FROM golang:${GOLANG_IMAGE_TAG}

# So using 8.16.0 for now
ARG VIPS_VERSION="8.16.0"

RUN wget https://github.com/libvips/libvips/releases/download/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.xz
RUN apk update && apk add automake build-base pkgconfig glib-dev gobject-introspection libxml2-dev expat-dev jpeg-dev libwebp-dev libpng-dev
# Exit 0 added because warnings tend to exit the build at a non-zero status
RUN tar -xf vips-${VIPS_VERSION}.tar.xz && cd vips-${VIPS_VERSION} && ./configure && make && make install && ldconfig; exit 0
RUN apk del automake build-base
