#!/bin/bash
# Install Puppet 4 on RHEL/CentOS 6

# URL to Puppet Labs Puppet Collection package
REPO_URL="http://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm"

# Install repository
echo -n "Installing Puppet Collection Release Package..."
yum -d 0 -e 0 -q -y install $REPO_URL
RET=$?
if [ $RET -eq 0 ]; then
	echo "Done"
else
	echo "Failed"
	exit $RET
fi

# Install agent
echo -n "Installing Puppet Agent..."
yum -d 0 -e 0 -q -y install puppet-agent
RET=$?
if [ $RET -eq 0 ]; then
	echo "Done"
else
	echo "Failed"
fi
exit $RET
