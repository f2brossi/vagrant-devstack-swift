require 'vagrant-openstack-provider'

Vagrant.configure("2") do |config|

  
  config.vm.provider :openstack do |os, override|
    override.vm.box = "dummy-openstack"
    override.vm.box_url = "https://github.com/ggiamarchi/vagrant-openstack/raw/master/source/dummy.box"

    
    os.username = ENV['OS_USERNAME']
    os.password = ENV['OS_PASSWORD']
    os.floating_ip_pool = "PublicNetwork-01"
    os.server_name = "devstack-swift"
    os.flavor = '2_vCPU_RAM_4G_HD_10G'
    os.image = /ubuntu-12.04_x86_64_LVM/
    os.openstack_auth_url = ENV['OS_AUTH_URL']
    os.tenant_name = ENV['OS_TENANT_NAME']
    os.ssh_username = "stack"
  end


  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "init.pp"
  end

end
