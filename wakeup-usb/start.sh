#!/bin/bash

sudo systemctl daemon-reload

# sudo nano /etc/udev/rules.d/99-usb-hub-wakeup.rules
# ACTION=="add|change", SUBSYSTEM=="usb", KERNEL=="3-2", ATTR{idVendor}=="0bda", ATTR{idProduct}=="5411", RUN+="/bin/systemctl restart usb-wakeup.service"
sudo udevadm control --reload-rules
sudo udevadm trigger