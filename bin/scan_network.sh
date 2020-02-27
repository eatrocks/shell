#!/bin/bash

 ifconfig | grep broadcast | arp -a
