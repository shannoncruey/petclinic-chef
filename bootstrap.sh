#!/usr/bin/env bash

# this is a chicken and egg script
# mostly to be used on a dev machine run via vagrant
# currently ubuntu flavored only

apt-get update
apt-get -y --quiet install git curl
git clone https://github.com/cloudsidekick/petclinic-chef.git /var/chef
mkdir -p /var/chef/tmp
chmod 755 -R /var/chef
curl https://www.opscode.com/chef/install.sh | /bin/bash
chef-solo -j /var/chef/solo.json -c /var/chef/solo.rb
chef-solo -j /var/chef/solo.json -c /var/chef/solo.rb
