run:
    /opt/shadowsocks2/shadowsocks2-linux -c \
        "ss://${method}:${password}@${host}" \
        -verbose -socks :1080 -u -udptun :8053=8.8.8.8:53,:8054=8.8.4.4:53 \
                                 -tcptun :8053=8.8.8.8:53,:8054=8.8.4.4:53