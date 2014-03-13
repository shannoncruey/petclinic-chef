#!/usr/bin/env bash

# this is a chicken and egg script
# mostly to be used on a dev machine run via vagrant
# currently ubuntu flavored only

#apt-get update
#apt-get -y --quiet install git curl
apt-get -y --quiet install curl
git clone https://github.com/cloudsidekick/petclinic-chef.git /var/chef
mkdir -p /var/chef/tmp
chmod 755 -R /var/chef
curl https://www.opscode.com/chef/install.sh | /bin/bash

echo '"run_list": [ "recipe[petclinic::default]" ]}' > /tmp/solo.json

chef-solo -j /tmp/solo.json -c /var/chef/solo.rb

# for some reason, the install doesn't complete until it is run again
# the second time around there should be no error
chef-solo -j /var/chef/solo.json -c /var/chef/solo.rb
