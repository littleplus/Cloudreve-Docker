#!/bin/sh
# If config file not exist, copy default config file to there
if [[ ! -f /root/cloudreve/cloudreve.conf ]]; then
  cp /root/files/* /root/cloudreve/
fi

# Run redis server and cloudreve
(redis-server &) && (./cloudreve -c ./cloudreve.conf)
