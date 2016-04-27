Overview
========

This is a Chef Repository that configures a development desktop machine.

Install
=============

First, install the Chef

`curl -L https://www.chef.io/chef/install.sh | sudo bash`

Set the Profile Preferences at Terminal window

`Run command as a login shell`

Set the user and group attributes

`cookbooks/desktop/attributes/default.rb`

Then run the Chef cookbook

`sudo chef-solo -c solo.rb -j solo.json`
