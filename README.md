Overview
========

This is a Chef Repository that configures a development desktop machine.

Install
=============

First install the RVM

`\curl -sSL https://get.rvm.io | bash -s stable --ruby`

Then run the Chef cookbook

`chef-solo -c solo.rb -j solo.json`