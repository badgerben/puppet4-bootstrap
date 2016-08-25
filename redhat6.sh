#!/bin/bash
# Install Puppet 4 on RHEL/CentOS 6

# Set default version to latest
VERSION=""

# Set VERSION if argument supplied
if [ ! -z "$1" ]; then
  VERSION="-$1"
fi

# URL to Puppet Labs Puppet Collection package
REPO_URL="https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm"

# Check if Puppet is installed
rpm -q puppet-agent > /dev/null 2>&1
RET=$?
if [ $RET -eq 0 ]; then
	echo "Puppet is already installed"
	exit $RET
fi

# Install repository
echo -n "Installing Puppet Collection Release Package..."
yum -y install $REPO_URL > /dev/null 2>&1
RET=$?
if [ $RET -eq 0 ]; then
	echo "Done"
else
	echo "Failed"
	exit $RET
fi

# Install agent
echo -n "Installing Puppet Agent..."
yum -y install puppet-agent$VERSION > /dev/null 2>&1
RET=$?
if [ $RET -eq 0 ]; then
	echo "Done"
else
	echo "Failed"
fi
exit $RET
