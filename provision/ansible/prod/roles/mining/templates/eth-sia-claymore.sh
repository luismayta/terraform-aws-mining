#!/bin/bash

# {{ ansible_managed }}

/home/mining/claymore-dual/ethdcrminer64 -epool eth-us-east1.nanopool.org:9999 \
    -ewal "{{ mining_address_eth }}.{{ mining_device_name }}/{{ mining_address_email }}" \
    -epsw x \
    -dcoin sia \
    -dpool stratum+tcp://sia-us-east1.nanopool.org:7777 \
    -dwal "{{ mining_address_sc }}/{{ mining_device_name }}/{{ mining_address_email }}" \
    -dpsw x \
    -ftime 10
