Vagrant.configure("2") do |config|
  config.vm.box = "yzgyyang/macOS-10.14"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "Mac VM"
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
end
