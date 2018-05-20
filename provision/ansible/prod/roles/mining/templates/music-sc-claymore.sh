#!/bin/bash

# {{ ansible_managed }}

/home/mining/claymore-dual/ethdcrminer64 -epool musicoin.nomnom.technology:9999 \
    -ewal {{ mining_address_music }} \
    -epsw x \
    -ethi 8 \
    -allcoins 1 \
    -esm 0 \
    -allpools 1 \
    -dcoin sia \
    -dpool stratum+tcp://sia-us-east1.nanopool.org:7777 \
    -dwal "{{ mining_address_sc }}/{{ mining_device_name }}/{{ mining_address_email }}" \
    -dpsw x
