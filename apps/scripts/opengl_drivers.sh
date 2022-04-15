#!/bin/bash

## Script to install the latest OpenGL drivers

set -e

# Install the latest OpenGL drivers
sudo add-apt-repository ppa:kisak/kisak-mesa

sudo apt-get update
sudo apt-get -y full-upgrade
sudo apt-get install -y mesa-utils


# Update the NVIDIA drivers (if GPU is attached)
sudo ubuntu-drivers autoinstall
