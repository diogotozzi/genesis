#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright 2015, Your Name
#

packages = [
  # Basic packages
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
  action :create
end

template "#{ENV['HOME']}/.aws/config" do
  source "config.erb"
end

template "#{ENV['HOME']}/.aws/credentials" do
  source "credentials.erb"
end

execute "Install AWS-Cli" do
  command "pip install awscli"
  action :run
end

# RVM install
execute "Install RVM" do
  command "\curl -sSL https://get.rvm.io | bash -s stable --ruby"
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