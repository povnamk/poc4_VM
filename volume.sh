#!/bin/bash
sudo file -s /dev/xvdb
sudo mkfs -t ext4 /dev/xvdb
sudo mkdir /newvolume
sudo mount /dev/xvdb /newvolume