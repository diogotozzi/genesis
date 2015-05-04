#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright 2015, Your Name
#

packages = [
  # Basic packages
  "aptitude",
  "build-essential",
  "curl",
  "dkms",
  "git",
  "htop",
  "nfs-common",
  "nfs-kernel-server",
  "python-pip",
  "sl",
  "unzip",
  "vim",
  "zip",
  # Media packages
  "ubuntu-restricted-extras",
  "vlc"
]

packages.each do |pack|
  package pack
end

# AWS configuration
directory "#{ENV['HOME']}/.aws" do
  owner "#{node["user"]}"
  group "#{node["group"]}"
  mode '0775'
  action :create
end

template "#{ENV['HOME']}/.aws/config" do
  source "config.erb"
  owner "#{node["user"]}"
  group "#{node["group"]}"
  mode '0775'
end

template "#{ENV['HOME']}/.aws/credentials" do
  source "credentials.erb"
  owner "#{node["user"]}"
  group "#{node["group"]}"
  mode '0775'
end

execute "Install AWS-Cli" do
  command "pip install awscli"
  action :run
end

# RVM
execute "Install RVM" do
  command "curl -sSL https://get.rvm.io | bash -s stable --ruby"
  action :run
end

# Git configuration
template "#{ENV['HOME']}/.gitconfig" do
  source "gitconfig.erb"
end

# Ruby Gems
execute "Install Gems" do
  command "gem install --no-ri --no-rdoc bundler capistrano capistrano-ec2_tagged capistrano-symfony chef knife-ec2"
  action :run
end

# VagrantUp
execute "Install VagrantUp" do
  command "wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb && dpkg -i vagrant_1.7.2_x86_64.deb"
  action :run
end

# VirtualBox
execute "Install VirtualBox" do
  command "wget http://download.virtualbox.org/virtualbox/4.3.26/virtualbox-4.3_4.3.26-98988~Ubuntu~raring_amd64.deb && dpkg -i virtualbox-4.3_4.3.26-98988~Ubuntu~raring_amd64.deb"
  action :run
end

# MySQL Workbench
execute "Install MySQL Workbench" do
  command "wget http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.3-1ubu1410-amd64.deb && dpkg -i mysql-workbench-community-6.3.3-1ubu1410-amd64.deb"
  action :run
end