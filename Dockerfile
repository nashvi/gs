FROM nnurphy/deb as b

ENV HOME=/root
ENV GOROOT=/opt/go GOPATH=${HOME}/go GO_VERSION=1.13.1
ENV PATH=${GOPATH}/bin:${GOROOT}/bin:$PATH
RUN set -ex \
  ; cd /opt \
  ; wget -q -O- https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz \
      | tar xzf - \
  ; go get -u -v github.com/shadowsocks/go-shadowsocks2 \
  ; rm -rf $(go env GOCACHE)/*

FROM debian:10-slim
COPY --from=b /root/go/bin /usr/local/bin
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]