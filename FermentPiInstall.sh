#! /bin/bash



#
# FermentPi
#

#
# FermentPi GitHub location:
# https://github.com/jmrieger/FermentPi

# FermentPi is a GPL v3 software
#

# This installer will update your RPi to the latest builds, install all FermentPi requisutes, and FermentPi

# Verify root access
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root: sudo ./install.sh" 1>&2
	exit 1
fi
echo -e ""

carp(){
	local format="$1"
	command shift 2>/dev/null
	echo -e "\n-------------------------------------------\n-------------------Error-------------------"
	echo -e "$format" "${@}"
	echo -e "------------------/Error-------------------\n-------------------------------------------"
}
croak() {
	local wasdf="$?"
	carp "$@"
	exit "$wasdf"
}

# Verify Internet connectivity
echo -en "Checking for Internet connectivity...";
ping -c 2 github.com &> /dev/null
if [ $? -ne 0 ]; then
	croak "No internet connection"
fi
echo -e ".Done!"

# Process core Raspberry Pi Upgrades
#echo -n "Updating existing packages..."
#sudo apt-get -qq update && sudo apt-get -qq -y upgrade
#echo -e ".Done!"

# Install Required Packages
echo -n "Installing apache, mod-rewrite, php, php-cli.."
sudo apt-get -qq install -y --force-yes apache2 libapache2-mod-python libapache2-mod-php5 php5-cgi php5 php5-cli || croak
sudo apache2ctl graceful &> /dev/null
sudo a2enmod rewrite &> /dev/null
ps ax | grep -v grep | grep apache2 &> /dev/null
if [ $? -eq 0 ]; then 
	echo -n "."
else
	croak "Apache is not running.  Please investigate and re-try installing"
fi
echo -e ".Done!"


# Install PHP Latest Version
echo -n "Installing Composer..."
composer -v &> /dev/null
if [ $? -ne 0 ]; then
	curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer &> /dev/null
	composer -v &> /dev/null
	if [ $? -ne 0 ]; then
		croak "Composer didn't install successfully. Please investigate and re-try installing"
	fi
fi
echo -e ".Done!"
