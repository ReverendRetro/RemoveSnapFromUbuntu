#!/bin/bash

# Call me a nerd I did not like how fast this ran so I put in sleeps between commands
# Version 2 will run faster

# Remove existing telemetry configuration files
echo "Removing existing Telemetry files to cleanly disable"
sleep 1
echo ""
sudo rm -rf /etc/default/no-report
sudo rm -rf /etc/popularity-contest
sudo rm -rf /etc/default/apport
sudo rm -rf /etc/default/whoopsie
echo "Removed existing Telemetry files"
echo ""

sleep 1

# Disable ubuntu-report
echo "Disabling ubuntu-report"
sleep 1
echo ""
sudo touch /etc/default/no-report
echo "Disabled ubuntu-report"
echo ""

sleep 1

# Disable popularity-contest
echo "Disabling Popularity Contest Metrics"
sleep 1
echo ""
sudo mkdir /etc/popularity-contest
sudo touch /etc/popularity-contest/popularity-contest.conf
sudo printf "ENABLED=false\n" >> /etc/popularity-contest/popularity-contest.conf
echo "Disabled the Popularity Contest metrics"
echo ""

sleep 1

# Disable automatic crash reports and bug reporting in apport
echo "Disabling automatic crash reports and bug reports"
sleep 1
echo ""
sudo touch /etc/default/apport
sudo printf "ENABLED=no\n" >> /etc/default/apport
sudo printf "ENABLE_AUTO_REPORT_BUGS=no\n" >> /etc/default/apport
echo "Disabled automatic crash reports and bug reports"
echo ""

sleep 1

# Disable whoopsie crash report sending
echo "Disabling whoopsie crash reports"
sleep 1
echo ""
sudo touch /etc/default/whoopsie
sudo printf "ENABLED=false\n" >> /etc/default/whoopsie
echo "Disabled whoopsie crash reports"
echo ""

sleep 1

echo "Telemetry and metrics collection disabled"
echo ""
echo "Made with love by ReverendRetro"
