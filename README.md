vagrant-devstack-swift
======================

Automate the creation of an openstack VM with devstack installed, running Swift &amp; Keystone


## Prereqs

Install [Vagrant 1.1+](http://vagrantup.com) on your local machine first.
Have an account with credentials on an openstack cloud provider (Numergy,  CloudWatt)


 ## Boot the remote virtual machine and install DevStack

     git clone https://github.com/f2brossi/vagrant-devstack-swift
     cd vagrant-devstack-swift
     vagrant plugin install vagrant-openstack-provider
     vagrant up --provider=openstack

 The `vagrant up --provider=openstack` command will:

  1. Download an Ubuntu 13.10 (saucy) vagrant box if it hasn't previously been downloaded to your machine.
  2. Boot the virtual machine (VM) on your openstack cloud provider .
  3. Clone the DevStack git repository inside of the VM.
  4. Run DevStack inside of the VM.

 It will take at least ten minutes for this to run.

NB: Of course it is possible to use virtualbox instead of an openstack cloud provider but then 8Gb of RAM are needed on your compute.

