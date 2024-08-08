# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'noble64'

  config.vm.cloud_init content_type: "text/cloud-config", path: "./user-data.yml"

  config.vm.provider 'virtualbox' do |v|
    v.customize [ 'modifyvm', :id, '--cpus', '2' ]
    v.customize [ 'modifyvm', :id, '--memory', '4096' ]
    v.customize [ 'modifyvm', :id, '--graphicscontroller', 'vmsvga' ]
    v.customize [ 'modifyvm', :id, '--vram', '22' ]
  end

  config.vm.hostname = 'noble'
  config.vm.network 'private_network', type: 'dhcp'

  #config.vm.provision :shell, path:   'Config/SetAuthKey.sh'

  # Install latest guest additions
  config.vbguest.auto_update = false
end
