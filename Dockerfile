FROM alpine:3.7
LABEL maintainer="https://github.com/4x0v7"
RUN apk --no-cache add \
    alpine-sdk \
    autoconf \
    automake \
    bash \
    iptables \
    libpcap-dev \
    libtool \
    m4 \
    texinfo
COPY . /app
WORKDIR /app
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
VOLUME [ "/app" ]