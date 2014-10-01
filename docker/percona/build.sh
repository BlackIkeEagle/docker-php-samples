#!/bin/bash
(( EUID != 0 )) && echo 'This script must be run as root.' && exit 1

docker build -t blackikeeagle/percona .
