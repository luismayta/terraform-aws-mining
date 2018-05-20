#!/bin/bash

# {{ ansible_managed }}

/home/mining/marlin/marlin \
    -u "{{ mining_address_sc }}.{{ mining_device_name }}" \
    -I {{ mining_sia_intensity }}
