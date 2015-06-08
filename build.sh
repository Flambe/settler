#!/usr/bin/env bash

# start with no machines
vagrant destroy -f
rm -rf .vagrant

time vagrant up --provider virtualbox 2>&1 | tee virtualbox-build-output.log
vagrant halt
vagrant package --base `ls ~/VirtualBox\ VMs | grep settler` --output virtualbox.box

ls -lh virtualbox.box

# clear out used machines
vagrant destroy -f
rm -rf .vagrant
