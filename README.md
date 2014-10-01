vagrant-devstack-swift
======================

Automate the creation of an openstack VM with devstack installed, running Swift &amp; Keystone


## Prereqs

Install [Vagrant 1.1+](http://vagrantup.com) on your local machine first.
An account on an openstack cloud provider (Numergy,  CloudWatt) with "OS_USERNAME, "OS_PASSWORD" and "OS_TENANT_ID"

NB: Of course you can use instead virtualbox but then 8GB of RAM are needed on your engine.

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



