FROM redis:5-alpine

# Replace alpine apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# Add glibc package
COPY ./glibc-2.31-r0.apk /lib/

# Add glibc key
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

# Install glibc
RUN apk add /lib/glibc-2.31-r0.apk

# Set workdir
WORKDIR /root/cloudreve

# Add start shell
COPY launch.sh /tmp/

# Add cloudreve binary file and default config file
COPY cloudreve cloudreve.conf /root/files/

# Entrypoint
CMD sh /tmp/launch.sh
