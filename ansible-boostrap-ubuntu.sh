#!/usr/bin/env bash
#
# This bootstraps Ansible & Librarian-Ansible on Ubuntu 16.04LTS.
# Based on the script at: https://github.com/hashicorp/puppet-bootstrap/
#
# However, we've updated it to also install and configure librarian-ansible
# We use librarian-ansible to auto-install 3rd party Ansible roles.
#
set -e

# Load up the release information
. /etc/lsb-release

#--------------------------------------------------------------------
# NO TUNABLES BELOW THIS POINT
#--------------------------------------------------------------------
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Install wget if we have to (some older Ubuntu versions)
echo "Installing wget..."
apt-get --yes install wget >/dev/null

# Install Ansible
echo "Installing Ansible..."
DEBIAN_FRONTEND=noninteractive apt-add-repository -y ppa:ansible/ansible >/dev/null
DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install ansible >/dev/null

echo "Ansible installed!"

### Start librarian-ansible installation & initialization

# Install Git
echo "Installing Git..."
apt-get install -y git >/dev/null
echo "Git installed!"

# let's check out the ansible-samvera roles from DCE's github repository:
#cd /vagrant && wget https://github.com/curationexperts/ansible-samvera/archive/master.zip && unzip master.zip roles

#git archive --remote=https://github.com/curationexperts/ansible-samvera master roles | tar xvf -

# Install 'librarian-ansible' and all third-party roles configured in Ansiblefile
if [ "$(gem search -i librarian-ansible)" = "false" ]; then
  echo "Installing librarian-ansible..."
  gem install --no-ri --no-rdoc librarian-ansible >/dev/null
  echo "librarian-ansible installed!"
  echo "Installing third-party Ansible roles (via librarian-ansible)..."
  cd /vagrant && librarian-ansible install --clean
else
  echo "Updating third-party Ansible roles (via librarian-ansible)..."
  cd /vagrant && librarian-ansible update
fi
