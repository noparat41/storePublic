cmd_/home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/linux/netfilter_arp/.install := /bin/bash scripts/headers_install.sh /home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/linux/netfilter_arp ./include/uapi/linux/netfilter_arp arp_tables.h arpt_mangle.h; /bin/bash scripts/headers_install.sh /home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/linux/netfilter_arp ./include/linux/netfilter_arp ; /bin/bash scripts/headers_install.sh /home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/linux/netfilter_arp ./include/generated/uapi/linux/netfilter_arp ; for F in ; do echo "$(pound)include <asm-generic/$$F>" > /home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/linux/netfilter_arp/$$F; done; touch /home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/linux/netfilter_arp/.install