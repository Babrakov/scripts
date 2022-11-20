#!/bin/sh

sudo /etc/xen/scripts/network-bridge start bridge=xenbr0 netdev=eth1
sudo xl create /mnt/xen/cfg/vm.cfg
