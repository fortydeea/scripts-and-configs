#!/bin/sh

sudo apt autoclean -y && \
sudo apt autoremove -y && \
sudo apt update -y && \
sudo apt dist-upgrade -y;
uptime;\
read a && sudo reboot
