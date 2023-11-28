#!/bin/bash
# Copy from Google drive to Local Folder
rclone sync /home/user/GoogleDrive GoogleDrive: --log-file /home/user/scripts/rclonesync.log
