#!/bin/bash

echo "Update distribution packages.."
sudo apt update
sudo apt dist-upgrade -y
echo "Rebooting..."
sudo reboot
