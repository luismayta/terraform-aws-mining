#!/bin/bash

# {{ ansible_managed }}

/home/mining/ccminer-alt/ccminer -o stratum+tcp://yiimp.eu:3334 \
    -u {{ mining_address_lbry }} \
    -d {{ mining_devices_lbry }} \
    -a lbry
