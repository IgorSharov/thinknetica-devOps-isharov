# -*- mode: ruby -*-
# vi: set ft=ruby :

machines=[
  {
    :name => "Vagrant-01",
    :ip => "192.168.56.4",
    :box => "hashicorp/precise64",
    :ram => 4*1024,
    :cpu => 2
  },
  {
    :name => "Vagrant-02",
    :ip => "192.168.56.5",
    :box => "hashicorp/precise64",
    :ram => 4*1024,
    :cpu => 2
  }
]

Vagrant.configure("2") do |config|
	machines.each do |machine|
		config.vm.define machine[:name] do |node|
			node.vm.box = machine[:box]
			node.vm.network "private_network", ip: machine[:ip], auto_config: false
			node.vm.provider "hyperv" do |h|
				h.vmname = machine[:name]
				h.cpus = machine[:cpu]
				h.memory = machine[:ram]
				h.ip_address_timeout = 240
			end
		end
	end
end
