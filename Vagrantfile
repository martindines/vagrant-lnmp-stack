Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "10.10.10.10"
  config.vm.network :forwarded_port, host: 5000, guest: 80
  config.vm.synced_folder "../", "/vagrant", type: "nfs"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end
end

