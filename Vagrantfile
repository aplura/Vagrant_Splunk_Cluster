##### LOCAL VARIABLES ######
##### Change these to match the environment you need to stand up. 
##### CAUTION: NOT ALL SPLUNK VERSIONS SUPPORT CLUSTERING COMMANDS - USE AT YOUR OWN RISK

_SPLUNK_VERSION = ["6.2.3","x86_64","rpm"]
_VAGRANT_BOX = "chef/centos-7.0"

### END LOCAL VARIABLES ###

Vagrant.configure("2") do |config|
  config.vm.box = _VAGRANT_BOX

	config.vm.define "master" do |master|
		master.vm.hostname = "vagrant-master"
                master.vm.network "private_network", ip: "10.10.50.130",
                        virtualbox__intnet: true
                master.vm.network :forwarded_port, host: 50130, guest: 8000
                master.vm.network :forwarded_port, host: 50131, guest: 8089
		master.vm.network :forwarded_port, host: 50132, guest: 8080

                master.vm.provision "splunk_base", type: "shell" do |s|
                        s.path = "bootstrap-mn.sh"
                        s.args = _SPLUNK_VERSION
                end

	end

	config.vm.define "idx1" do |idx1|
		idx1.vm.hostname = "vagrant-idx1"
		idx1.vm.network "private_network", ip: "10.10.50.100",
			virtualbox__intnet: true
		idx1.vm.network :forwarded_port, host: 50100, guest: 8000
		idx1.vm.network :forwarded_port, host: 50101, guest: 8089

		idx1.vm.provision "splunk_base", type: "shell" do |s|
                        s.path = "bootstrap-idx.sh"
                        s.args = _SPLUNK_VERSION
    		end

	end

	config.vm.define "idx2" do |idx2|
		idx2.vm.hostname = "vagrant-idx2"
                idx2.vm.network "private_network", ip: "10.10.50.110",
                        virtualbox__intnet: true
                idx2.vm.network :forwarded_port, host: 50110, guest: 8000
                idx2.vm.network :forwarded_port, host: 50111, guest: 8089

                idx2.vm.provision "splunk_base", type: "shell" do |s|
                        s.path = "bootstrap-idx.sh"
                        s.args = _SPLUNK_VERSION
                end

        end


	config.vm.define "idx3" do |idx3|
		idx3.vm.hostname = "vagrant-idx3"
                idx3.vm.network "private_network", ip: "10.10.50.120",
                        virtualbox__intnet: true
                idx3.vm.network :forwarded_port, host: 50120, guest: 8000
                idx3.vm.network :forwarded_port, host: 50121, guest: 8089

                idx3.vm.provision "splunk_base", type: "shell" do |s|
                        s.path = "bootstrap-idx.sh"
                        s.args = _SPLUNK_VERSION
                end

        end

	config.vm.define "shc1" do |shc1|
		shc1.vm.hostname = "vagrant-shc1"
                shc1.vm.network "private_network", ip: "10.10.50.140",
                        virtualbox__intnet: true
                shc1.vm.network :forwarded_port, host: 50140, guest: 8000
                shc1.vm.network :forwarded_port, host: 50141, guest: 8089

                shc1.vm.provision "splunk_base", type: "shell" do |s|
                        s.path = "bootstrap-shc.sh"
                        s.args = _SPLUNK_VERSION
                end

        end

        config.vm.define "shc2" do |shc2|
                shc2.vm.hostname = "vagrant-shc2"
		shc2.vm.network "private_network", ip: "10.10.50.150",
                        virtualbox__intnet: true
                shc2.vm.network :forwarded_port, host: 50150, guest: 8000
                shc2.vm.network :forwarded_port, host: 50151, guest: 8089

                shc2.vm.provision "splunk_base", type: "shell" do |s|
                        s.path = "bootstrap-shc.sh"
                        s.args = _SPLUNK_VERSION
                end

        end


        config.vm.define "shc3" do |shc3|
		shc3.vm.hostname = "vagrant-shc3"
                shc3.vm.network "private_network", ip: "10.10.50.160",
                        virtualbox__intnet: true
                shc3.vm.network :forwarded_port, host: 50160, guest: 8000
                shc3.vm.network :forwarded_port, host: 50161, guest: 8089

                shc3.vm.provision "splunk_base", type: "shell" do |s|
                        s.path = "bootstrap-shc.sh"
                        s.args = _SPLUNK_VERSION
                end

        end
end
