#!/bin/bash

# {{ ansible_managed }}

/home/mining/ccminer-cryptonight/ccminer -o stratum+tcp://xdn-xmr.pool.minergate.com:45790 \
    -u {{ mining_address_email }} \
    -p x --color -d {{ mining_devices_xmr_xdn }}
