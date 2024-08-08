#!/bin/bash

mkdir tmp_ova
curl -LO https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.ova
tar xzf noble-server-cloudimg-amd64.ova -C tmp_ova
mv tmp_ova/ubuntu-noble-24.04-cloudimg.ovf tmp_ova/box.ovf
cp metadata.json tmp_ova/metadata.json
tar czf noble-server-cloudimg-amd64.ova -C tmp_ova .
rm -rf tmp_ova

vagrant box add --name noble64 ./noble-server-cloudimg-amd64.ova
vagrant box list
vagrant plugin install vagrant-vbguest
