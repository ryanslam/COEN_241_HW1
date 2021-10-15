# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_BOX = 'ubuntu/trusty64'

Vagrant.configure("2") do |config|

  # Select the vm box we want to use.
  config.vm.box = VAGRANT_BOX

  # Initialize the provider as virtualbox.
  config.vm.provider "virtualbox" do |vb|
    
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    # Update apt get to prime installation of sysbench.
    apt-get update -y 
    # Install sysbench using apt-get install, when machine is booted up.
    apt-get install sysbench -y

    # Create directory and scripts for sysbench to run as benchmarks later.
    mkdir sysbench_scripts 
    cd sysbench_scripts
    echo 'sysbench --test=cpu --cpu-max-prime=$1 --num-threads=$2 run' >> ./run_cpu.sh
    echo "sysbench --num-threads=$1 --test=fileio --file-total-size=3G prepare
    \nsysbench --num-threads=$1 --test=fileio --file-total-size=3G --file-test-mode=rndrw --max-time=300 --max-requests=0 run
    \nsysbench --num-threads=$1 --test=fileio --file-total-size=3G cleanup" >> ./run_fileio.sh

  SHELL
end
