# -*- mode: ruby -*-
# vi: set ft=ruby :

# fetch VBox Version Number
vbox_release_version = `VBoxManage --version`
vbox_version = /[0-9]+\.[0-9]+\.[0-9]+/.match(vbox_release_version)

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

  $script = <<-SCRIPT
sudo apt update
sudo apt upgrade -yqq
sudo apt-get install linux-headers-$(uname -r) build-essential dkms -yqq
wget http://download.virtualbox.org/virtualbox/#{vbox_version}/VBoxGuestAdditions_#{vbox_version}.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_#{vbox_version}.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
rm VBoxGuestAdditions_#{vbox_version}.iso
modinfo vboxguest
apt clean
apt autoremove -y
SCRIPT

  config.vm.provision "shell", inline: $script
end
