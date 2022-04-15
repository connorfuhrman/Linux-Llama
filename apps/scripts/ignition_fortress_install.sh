#!/bin/bash

## Script to install Ignition Fortress via the package manager
## Instructions from https://ignitionrobotics.org/docs/fortress/install_ubuntu

set -e

printf "You will be asked for the sudo password at least once\n"

sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt-get update
sudo apt-get install -y ignition-fortress
