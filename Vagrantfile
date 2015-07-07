# -*- mode: ruby -*-
# vi: set ft=ruby :

# Read YAML file with box details
def parse_config(config_file=File.expand_path(File.join(File.dirname(__FILE__), 'hosts.yaml')))
  require 'yaml'
  # default values
  config = {
    'local_webroot'           => '../www',
    'local_hostname'          => 'events.esri.com',
    'local_hostname_aliases'  => [
       'events.esri.com',
       'dbg-dev.local'
    ]
  }
  if File.exists?(config_file)
    overrides = YAML.load_file(config_file)
    config.merge!(overrides)
  end
  config
end

def create_multiple_host_array(hosts)
  www_hosts = Array.new
  db_hosts = Array.new

  hosts.each do |host|
    www_hosts.push 'www.'+host
    db_hosts.push 'db.'+host
  end

  www_hosts | db_hosts
end

v_config = parse_config

# Server Configuration
vm_ip_address = "192.168.50.25"
vm_naked_hostname = v_config["local_hostname"]

Vagrant.configure(2) do |config|
  # Using CentOS 7.1 built with Packer
  config.vm.box = "centos71"

  config.vm.provider "virtualbox" do |v|
    v.name = "vagrant-lucee-centos-x64"

    # the next two settings enable using the host computer's dns inside the vagrant box
    # enable dns proxy in nat mode
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # use the host's resolver as a dns proxy in nat mode
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # set vm ip address and add auto_correct on forwarded port so it doesn't collide with other vagrant boxes
  config.vm.network :private_network, ip: vm_ip_address

  if Vagrant.has_plugin?("vagrant-hostsupdater")
    config.vm.hostname = vm_naked_hostname
    config.hostsupdater.aliases = create_multiple_host_array(v_config["local_hostname_aliases"])
  end
end
