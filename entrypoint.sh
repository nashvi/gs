#!/usr/bin/env bash

if [ -z $1 ]; then
    exec /bin/bash
elif [[ $1 == "-cu" ]]; then
    /usr/local/bin/go-shadowsocks2 -c $2 \
        -verbose -socks :1080 -u -udptun :8053=8.8.8.8:53,:8054=8.8.4.4:53 \
                                 -tcptun :8053=8.8.8.8:53,:8054=8.8.4.4:53
elif [[ $1 == "-c" ]]; then
    /usr/local/bin/go-shadowsocks2 -c $2 \
        -verbose -socks :1080
else
    exec "$@"
fi