v2ray:
    docker run \
        -p 1080:1080 \
        -p 1081:1081 \
        -d --restart=always \
        -v $(pwd)/v2ray.json:/etc/v2ray/config.json \
        --name=v2ray \
        nnurphy/v2ray 

img:
    docker run \
        -p 1080:1080 \
        -p 1081:1081 \
        -d --restart=always \
        --name gs \
        nashv1/gs \
        -cu "ss://${method}:${password}@${host}"
