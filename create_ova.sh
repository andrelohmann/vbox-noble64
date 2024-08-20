#!/bin/bash

ls -al
curl -LO https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.ova
tar --list -f noble-server-cloudimg-amd64.ova
tar --extract -f noble-server-cloudimg-amd64.ova ubuntu-noble-24.04-cloudimg.ovf
tar --delete -f noble-server-cloudimg-amd64.ova ubuntu-noble-24.04-cloudimg.ovf
mv ubuntu-noble-24.04-cloudimg.ovf box.ovf
tar --append -f noble-server-cloudimg-amd64.ova box.ovf
rm box.ovf
tar --append -f noble-server-cloudimg-amd64.ova metadata.json
tar --list -f noble-server-cloudimg-amd64.ova

vagrant box add --name noble64 ./noble-server-cloudimg-amd64.ova
vagrant box list
#vagrant plugin install vagrant-vbguest

vagrant up
vagrant box list
vagrant box repackage noble64 virtualbox $(date '+%Y%m%d')
vagrant box list
vagrant destroy -f

vagrant box list
vagrant box remove noble64
