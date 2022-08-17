OUTPUT="$(pwd)/images"
BUILDER="https://downloads.openwrt.org/releases/21.02.3/targets/bcm27xx/bcm2708/openwrt-imagebuilder-21.02.3-bcm27xx-bcm2708.Linux-x86_64.tar.xz"

# download image builder
if [ ! -f "${BUILDER##*/}" ]; then
	wget "$BUILDER"
	tar xJvf "${BUILDER##*/}"
fi

mkdir "$OUTPUT"
cd openwrt-*/

# list all targets for this image builder, consider 'make help' as well
# make info

# clean previous images
make clean

mkdir -p files/etc/uci-defaults

cat << "EOF" > files/etc/uci-defaults/xxx_config
uci set wireless.@wifi-device[0].disabled="0"
uci set wireless.@wifi-iface[0].disabled="0"
uci set wireless.@wifi-iface[0].ssid="OpenWrt"
uci set wireless.@wifi-iface[0].key="curliemonkey"
uci set wireless.@wifi-iface[0].encryption="psk2"
uci commit wireless
EOF


make image  PROFILE="rpi" \
           PACKAGES="luci-base luci-ssl luci-mod-admin-full luci-theme-bootstrap" \
            BIN_DIR="$OUTPUT" \
            FILES="files"
