FROM amazonlinux AS buildimg

RUN yum -y install make wget tar gzip xz perl unzip bzip2 perl perl-Data-Dumper \
    perl-Thread-Queue python3 git rsync which file

COPY build.sh /build.sh

RUN chmod +x /build.sh
RUN /build.sh

FROM scratch AS export

COPY --from=buildimg /images/openwrt-21.02.3-bcm27xx-bcm2708-rpi-ext4-factory.img.gz .
