#!/bin/sh -x
#

# locale
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# authconfig stuff
authconfig --enableshadow --passalgo=sha512 --updateall

# Timezone
cp /usr/share/zoneinfo/UTC /etc/localtime
echo 'ZONE="UTC"' > /etc/sysconfig/clock

# Set tuned profile to virtual-guest for use in AWS/virt
echo "virtual-guest" > /etc/tuned/active_profile

# Disallow root login via SSHD
sed -i -r 's@^#?PermitRootLogin.*$@PermitRootLogin no@' /etc/ssh/sshd_config

# Remove requiretty setting in sudoers if it exists
sed -i -r "s@^.*requiretty@#Defaults !requiretty@" /etc/sudoers

# disable firstboot
echo "RUN_FIRSTBOOT=NO" > /etc/sysconfig/firstboot

# setup systemd to boot to the right runlevel
rm -f /etc/systemd/system/default.target
ln -s /lib/systemd/system/multi-user.target /etc/systemd/system/default.target

# disable AutoVT services for TTYs
sed -i -r 's@^#NAutoVTs=.*@NAutoVTs=0@' /etc/systemd/logind.conf
