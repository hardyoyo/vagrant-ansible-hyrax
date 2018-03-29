# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #config.vm.box = "ubuntu/xenial64"

  # use my Samvera-Basebox
#  config.vm.box = "hardyoyo/Samvera-Basebox"
  config.vm.box = "ksclarke/samvera-base"
  config.vm.box_version = "0.0.2.pre.1522339920"

  # use Kevin's samvera-base box
#  config.vm.box = "ksclarke/samvera-base"

  #skip the inserting of a key, because it's problematic and not needed
  config.ssh.insert_key = false

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

    #-----------------------------
    # HD Settings
    #-----------------------------
    # if we have the disksize plugin, request a specific disk size
    if Vagrant.has_plugin?('vagrant-disksize')
        config.disksize.size = '50GB'
    end

    #------------------------
    # Provisioning Scripts
    #    These scripts run in the order in which they appear, and setup the virtual machine (VM) for us.
    #------------------------

    # Shell script to set up swap space for this VM

    if File.exists?("config/increase-swap.sh")
        config.vm.provision :shell, :name => "creating a swap file", :inline => "echo '   > > > running local increase-swap.sh to ensure enough memory is available, via a swap file.'"
        config.vm.provision :shell, :name => "creating a swap file with a local increase-swap.sh script", :path => "config/increase-swap.sh"
    else
        config.vm.provision :shell, :name => "creating a swap file", :inline => "echo '   > > > running default increase-swap.sh scripte to ensure enough memory is available, via a swap file.'"
        config.vm.provision :shell, :name => "creating a swap file with the default increase-swap.sh script", :path => "increase-swap.sh"
    end


    # Shell script to set apt sources.list to something appropriate (close to you, and actually up)
    # via apt-spy2 (https://github.com/lagged/apt-spy2)

    # If a customized version of this script exists in the config folder, use that instead

    if File.exists?("config/apt-spy-2-bootstrap.sh")
        config.vm.provision :shell, :name => "apt-spy-2, locating a nearby mirror", :inline => "echo '   > > > running local apt-spy2 to locate a nearby mirror (for quicker installs). Do not worry if it shows an error, it will be OK, there is a fallback.'"
        config.vm.provision :shell, :name => "apt-spy-2, running custom apt-spy-2-bootstrap", :path => "config/apt-spy-2-bootstrap.sh"
    else
        config.vm.provision :shell, :name => "apt-spy2, locating a nearby mirror", :inline => "echo '   > > > running default apt-spy2 to locate a nearby mirror (for quicker installs). Do not worry if it shows an error, it will be OK, there is a fallback.'"
        config.vm.provision :shell, :name => "apt-spy2, running default apt-spy-2-bootstrap", :path => "apt-spy-2-bootstrap.sh"
    end

    # run ansible bootstrap
    config.vm.provision :shell, :name => "running ansible-bootstrap", :path => "ansible-boostrap-ubuntu.sh"

    # provision with ansible_local
    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook          = "playbook.yml"
      ansible.verbose           = true
      ansible.limit             = "local" #Yeah, don't do prod just yet, OK? Thanks!
      ansible.provisioning_path = "/vagrant/ansible"
      ansible.inventory_path    = "/vagrant/ansible/inventory"
    end

    # housekeeping
    config.vm.hostname = "hyrax"
    config.vm.network :private_network, ip: "192.168.33.33"

    # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
    config.vm.define :hyrax do |hyrax|
    end

end
