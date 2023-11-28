#!/bin/bash
# to disable trash --drive-use-trash=false
# to open docs --vfs-cache-mode=full
rclone mount --drive-use-trash=false --vfs-cache-mode=full GoogleDrive:/ /home/user/GoogleDrive
