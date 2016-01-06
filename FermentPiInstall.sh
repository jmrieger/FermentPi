#! /bin/bash



#
# FermentPi
#

#
# FermentPi GitHub location:
#

# FermentPi is a GPL v3 software
#

# This installer will update your RPi to the latest builds, install all FermentPi requisutes, and FermentPi

# FermentPi Uses the following core technologies:
# NodeJS - With fivdi/onoff, allows GPIO access to the RaspberryPi board
#

# Process core Raspberry Pi Upgrades
echo "\n"
echo "Updating existing packages..."
sudo apt-get -qq update && sudo apt-get -qq -y upgrade
echo ".Done!\n"

# Install Required Packages
echo "\n"
echo "Installing apache, mod-rewrite, fastcgi..."
sudo apt-get -qq install -y --force-yes apache2
sudo apt-get -qq libapache2-mod-python
sudo apt-get -qq libapache2-mod-fastcgi
sudo a2enmod fastcgi
sudo apache2ctl graceful
echo ".Done!\n"
