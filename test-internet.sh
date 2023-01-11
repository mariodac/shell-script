#!/bin/bash

wget https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py -O /tmp/speedtest-cli
sudo chmod +x speedtest-cli
speedtest-cli --share