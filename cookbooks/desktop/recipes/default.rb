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
  "libgmp-dev",
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

# Set clock at Ubuntu from UTC to Local Time
execute "Set Ubuntu clock to UTC" do
  command "timedatectl set-local-rtc 1"
  action :run
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
