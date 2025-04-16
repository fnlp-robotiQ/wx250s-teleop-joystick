#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo cp "${SCRIPT_DIR}/99-interbotix-udev.rules" /etc/udev/rules.d/

sudo udevadm control --reload-rules && udevadm trigger
