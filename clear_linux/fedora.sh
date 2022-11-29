#!/bin/bash

#You can run the following command to delete older kernel versions except the current running one and the last one.
dnf remove $(dnf repoquery --installonly --latest-limit=-2 -q) 