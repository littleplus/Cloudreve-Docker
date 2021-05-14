#!/bin/bash
# Clean
docker stop cloudreve
docker rm cloudreve

# Run a container as daemon
# mount host '/etc/cloudreve' as container '/etc/cloudreve'
# mount host '/data/cloudreve' as container '/data'
# bind host address '0.0.0.0:8081' to container port '8080'
docker run -d --name cloudreve -v /etc/cloudreve:/etc/cloudreve -v /data/cloudreve:/data -p 8081:8080 littleplus/cloudreve-3.0.0-rc-1:sqlite
# For retrieving first login info
docker logs cloudreve
