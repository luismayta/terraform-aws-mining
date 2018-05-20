#!/bin/bash

# {{ ansible_managed }}

/home/mining/ccminer/ccminer -d {{ mining_devices_sc }} \
    -a sia -o stratum+tcp://us-east.siamining.com:3333 \
    -u "{{ mining_address_sc }}.{{ mining_device_name }}" \
    -i {{ mining_sia_intensity }}
