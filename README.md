# Raspberry Pi Wireguard Router
Use a raspbery pi zero w as a wireguard router using OpenWRT. This docker file enables WiFi at start up.  Be sure to update the password!

## Build
Build a fresh image for Raspberry-PI-Zero-W

```shell script
DOCKER_BUILDKIT=1 docker build --file Dockerfile --output images .
```
You will find the raspberry pi image in the images directory:
```
➜ ls images
openwrt-21.02.3-bcm27xx-bcm2708-rpi-ext4-factory.img.gz
```

- Write to an SD Card: use Raspberry Pi Imager for that.

- Pop it into your Raspberry PI Zero W

- Select `OpenWrt` WiFi Network

- Browse to 192.168.1.1

- Configure as a router....
