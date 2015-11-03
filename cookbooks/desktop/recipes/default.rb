#
# Cookbook Name:: desktop
# Recipe:: default
#
# Copyright 2015, Your Name
#

packages = [
  # Basic packages
  "gawk",
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

# Git configuration
template "#{ENV['HOME']}/.gitconfig" do
  source "gitconfig.erb"
  owner "#{node["user"]}"
  group "#{node["group"]}"
  mode '0775'
end

execute "Install AWS-Cli" do
  user "#{node["user"]}"
  command "pip install awscli"
  action :run
end
