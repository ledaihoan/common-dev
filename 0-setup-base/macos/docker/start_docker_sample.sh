#!/usr/bin/env bash
NUMBER_OF_CPU=6
RAM_SIZE_GB=12
DISK_SIZE_GB=80
colima start --kubernetes --cpu $NUMBER_OF_CPU --memory $RAM_SIZE_GB --disk $DISK_SIZE_GB

