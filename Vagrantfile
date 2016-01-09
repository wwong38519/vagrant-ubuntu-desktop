VAGRANTFILE_API_VERSION ||= "2"

box = "box-cutter/ubuntu1404-desktop"
name = "vagrant-ubuntu-desktop"
mem = "4024"
ipaddr = "192.168.0.40"
script = "provisioning/provision.sh"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box_check_update = false

	config.vm.define name, primary: true do |app|
		app.vm.box = box
		app.vm.network :private_network, ip: ipaddr
		app.vm.provider :virtualbox do |vb|
			vb.name = name
			vb.memory = mem
			vb.gui = true
		end
		app.vm.provision :shell, path: script
	end
end
