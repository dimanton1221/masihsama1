#!/bin/sh

# php server start
cat << EOF > /usr/bin/config.json
{
    "log": {
        "loglevel": "none"
    },
    "inbounds": [
        {
            "port": 8080,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "e71e137f-c919-49ca-fb1c-c73ff4ac0a66",
                        "level": 0
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": ""
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF


startae -c /usr/bin/config.json