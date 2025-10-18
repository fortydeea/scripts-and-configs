#!/bin/sh

# This script fixes monitor blacking out when using KVM switch with KDE Plasma 6.
# Replace the MONITOR_NAME with the problematic monitor.

MONITOR_NAME="HDMI-A-1"

kscreen-doctor output.${MONITOR_NAME}.disable
sleep 1
kscreen-doctor output.${MONITOR_NAME}.enable
