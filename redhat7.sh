#!/bin/bash
# Install Puppet 4 on RHEL/CentOS 7

# URL to Puppet Labs Puppet Collection package
REPO_URL="https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm"

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
yum -y install puppet-agent > /dev/null 2>&1
RET=$?
if [ $RET -eq 0 ]; then
	echo "Done"
else
	echo "Failed"
fi
exit $RET
